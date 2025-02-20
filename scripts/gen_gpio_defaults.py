#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# ----------------------------------------------------------------------
#
# gen_gpio_defaults.py ---
#
# Manipulate the magic database to create and apply defaults to
# the GPIO control blocks based on the user's specification in the
# user_defines.v file.
#
# The GPIO defaults block contains 16 bits that set the state of the
# GPIO on power-up. GPIOs 0 to 7 and 64 to 65 in the user project area are fixed
# and cannot be modified (to maintain access to the housekeeping SPI
# on startup).  GPIOs 8 to 63 are by default set to be a bidirectional pad
# controlled by the SoC.  The file "user_defines.v" contains
# the state specified by the user for each GPIO pad, and is what is
# used in verilog simulation.
#
# This script parses the user_defines.v file to determine the state
# of each GPIO.  Then it creates as many new layouts as needed to
# represent all unique states, modifies the frigate_core.mag layout
# to replace the default layouts with the new ones as needed, and
# generates mag files for each of the layouts.
#
# gpio_defaults_block_16bit layout map:
# Positions marked (in microns) for value = 0.  For value = 1, move
# the via 0.69um to the left.  The given position is the lower left
# corner position of the via.  The via itself is 0.17um x 0.17um.
# The values below are for the file gpio_defaults_block_16bit.
#
# Signal            Via position (um)
# name		        X       Y
# -------------------------------------------------------------------
# gpio_defaults[0]  2.785   3.825
# gpio_defaults[1]	4.165   3.825
# gpio_defaults[2]	5.545   3.825
# gpio_defaults[3]	6.925   3.825
# gpio_defaults[4]	8.305   3.825
# gpio_defaults[5]	9.685   3.825
# gpio_defaults[6]	11.985  3.825
# gpio_defaults[7]  13.365  3.825
# gpio_defaults[8]  14.745  3.825
# gpio_defaults[9]  16.585  3.825
# gpio_defaults[10] 17.965  3.825
# gpio_defaults[11]	19.345  3.825
# gpio_defaults[12] 20.725  3.825
# gpio_defaults[13] 22.105  3.825
# gpio_defaults[14] 23.945  3.825
# gpio_defaults[15] 25.325  3.825
# -------------------------------------------------------------------

import os
import sys
import re
import click
import subprocess



@click.command(
    help="""
    Manipulate the magic database to create and apply defaults to the GPIO 
    control blocks based on the user's specification in the user_defines.v file
    """
)
@click.argument(
    "dir",
    type=click.Path(exists=True, file_okay=False),
    default=os.getcwd(),
    required=False
)
@click.option(
    "--debug",
    is_flag=True,
    default=False,
)
def main(dir, debug):
    # Generate zero and one coordinates for each via based on their positions in the 0 gpio defaults mag
    zero_string, one_string = via_pos_info()
    magpath = dir + "/mag"
    vpath = dir + "/verilog"
    glpath = vpath + "/gl"
    user_defines_path = vpath + "/rtl/user_defines.v"
    user_defines_path, frigate_path = prepare_env(
        dir, magpath, vpath, glpath, user_defines_path
    )

    # Set additional dictionary entries for the fixed-configuration
    # GPIOs 0 to 7 and 64 to 65.  This allows the layout to have the default
    # gpio_defaults_block layout, and this script will change it as needed.
    gpio_configs_dict = fixed_configs()

    # Parse the user defines verilog file
    with open(user_defines_path, "r") as ifile:
        defines = ifile.readlines()
    for line in defines:
        tokens = line.split()
        if len(tokens) >= 3:
            if tokens[0] == "`define":
                if tokens[2][0] == "`":
                    # If definition is nested, substitute value.
                    try:
                        tokens[2] = gpio_configs_dict[tokens[2]]
                    except:
                        print("Error:  Used unknown definition " + tokens[2])
                gpio_configs_dict["`" + tokens[1]] = tokens[2]

    # Create new cells for each unique type
    print("Step 1:  Create new cells for new GPIO default vectors.")

    cellsused = [None] * 66
    for i in range(0, 66):
        config_name = "`USER_CONFIG_GPIO_" + str(i) + "_INIT"
        try:
            config_value = gpio_configs_dict[config_name]
        except:
            print("No configuration specified for GPIO " + str(i) + "; skipping.")
            continue

        try:
            default_str = config_value[-4:]
            binval = "{:016b}".format(int(default_str, 16))
        except:
            print(
                "Error:  Default value "
                + config_value
                + " is not a 4-digit hex number; skipping"
            )
            continue

        cell_name = "gpio_defaults_block_16bit_" + default_str
        mag_file = magpath + "/" + cell_name + ".mag"
        cellsused[i] = cell_name

        # Record which bits need to be set for this binval
        bitflips = []
        notflipped = []
        for j in range(0, 16):
            if binval[15 - j] == "1":
                bitflips.append(j)
            else:
                notflipped.append(j)

        if not os.path.isfile(mag_file):
            # A cell with this set of defaults doesn't exist, so make it
            # First read the 0000 cell, then write to mag_path while
            # changing the position of vias on the "1" bits

            with open(
                frigate_path + "/mag/gpio_defaults_block_16bit.mag", "r"
            ) as ifile:
                maglines = ifile.readlines()
            outlines = []
            for magline in maglines:
                is_flipped = False
                reverse_flipped = False
                for bitflip in bitflips:
                    if magline == zero_string[bitflip]:
                        is_flipped = True
                        break
                if not is_flipped:
                    for bitflip in notflipped:
                        if magline == one_string[bitflip]:
                            reverse_flipped = True
                            break

                if is_flipped:
                    outlines.append(one_string[bitflip])
                elif reverse_flipped:
                    outlines.append(zero_string[bitflip])
                else:
                    outlines.append(magline)

            print("Creating new layout file " + mag_file)
            if debug:
                print("(Test only)")
            else:
                with open(mag_file, "w") as ofile:
                    ofile.writelines(outlines)
        else:
            print(
                "Layout file "
                + mag_file
                + " already exists and does not need to be generated."
            )

        gl_file = glpath + "/" + cell_name + ".v"

        defrex = re.compile(f"[ \t]*assign[ \t]+gpio_defaults\\[([0-9]+)\\]")

        if not os.path.isfile(gl_file):
            # A cell with this set of defaults doesn't exist, so make it
            # First read the default cell, then write to gl_path while
            # changing the assignment statements at the bottom of each file.

            with open(
                frigate_path + "/verilog/gl/gpio_defaults_block_16bit.v", "r"
            ) as ifile:
                vlines = ifile.readlines()
            outlines = []
            for vline in vlines:
                is_flipped = False
                is_reversed = False
                dmatch = defrex.match(vline)
                if dmatch:
                    bitidx = int(dmatch.group(1))
                    if bitidx in bitflips:
                        is_flipped = True
                    else:
                        is_reversed = True
                if is_flipped:
                    outlines.append(re.sub("_low", "_high", vline))
                elif is_reversed:
                    outlines.append(re.sub("_high", "_low", vline))
                elif "gpio_defaults_block_16bit" in vline:
                    outlines.append(
                        re.sub("gpio_defaults_block_16bit", cell_name, vline)
                    )
                else:
                    outlines.append(vline)

            print("Creating new gate-level verilog file " + gl_file)
            if debug:
                print("(Test only)")
            else:
                with open(gl_file, "w") as ofile:
                    ofile.writelines(outlines)

        else:
            print(
                "Gate-level verilog file "
                + gl_file
                + " already exists and does not need to be generated."
            )

    print("Step 2:  Modify top-level layouts to use the specified defaults.")

    idxrex = re.compile("gpio_defaults_block_([0-9]+)")
    if debug:
        print("Test only:  Frigate core layout:")

    # Check for compressed layout
    is_compressed = False
    if not os.path.isfile(frigate_path + "/mag/frigate_core.mag"):
        if os.path.isfile(frigate_path + "/mag/frigate_core.mag.gz"):
            is_compressed = True
            print("Uncompressing frigate_core.mag.gz")
            subprocess.run(["gunzip", frigate_path + "/mag/frigate_core.mag.gz"])

    with open(frigate_path + "/mag/frigate_core.mag", "r") as ifile:
        maglines = ifile.readlines()
    outlines = []
    for magline in maglines:
        if magline.startswith("use "):
            tokens = magline.split()
            instname = tokens[2]
            if instname.startswith("gpio_defaults_block_"):
                imatch = idxrex.match(instname)
                if imatch:
                    gpioidx = int(imatch.group(1))
                else:
                    print("Error: instance " + instname + " not a defaults block?")
                cellname = cellsused[gpioidx]
                if cellname:
                    tokens[1] = cellname
                outlines.append(" ".join(tokens))
                if debug:
                    print("Replacing line: " + magline)
                    print("With: " + " ".join(tokens))
            else:
                outlines.append(magline)
        else:
            outlines.append(magline)

    if not debug:
        with open(magpath + "/frigate_core.mag", "w") as ofile:
            ofile.writelines(outlines)

    if is_compressed:
        print("Compressing frigate_core.mag")
        subprocess.run(["gzip", "-n", "--best", frigate_path + "/mag/frigate_core.mag"])

    # Do the same to the core gate-level verilog
    instrex = re.compile(
        "[ \t]*(gpio_defaults_block_16bit_?[0-1]?[0-9A-Fa-f]*)[ \t]+gpio_defaults_block_([0-9]+)"
    )

    if debug:
        print("Test only:  Caravel top gate-level verilog:")
    with open(frigate_path + "/verilog/gl/frigate_core.v", "r") as ifile:
        vlines = ifile.readlines()
    outlines = []
    for vline in vlines:
        imatch = instrex.match(vline)
        if imatch:
            gpioidx = int(imatch.group(2))
        if imatch:
            gpioname = imatch.group(1)
            cellname = cellsused[gpioidx]
            if cellname:
                outlines.append(re.sub(gpioname, cellname, vline, 1))
                if debug:
                    print("Replacing line: " + vline)
                    print("With: " + outlines[-1])
            else:
                outlines.append(vline)
        else:
            outlines.append(vline)

    if not debug:
        with open(glpath + "/frigate_core.v", "w") as ofile:
            ofile.writelines(outlines)

    print("Done.")


def via_pos_info():
    # Coordinate pairs in microns for the zero position on each bit
    via_pos = [
        [2.785, 3.825],
        [4.165, 3.825],
        [5.545, 3.825],
        [6.925, 3.825],
        [8.305, 3.825],
        [9.685, 3.825],
        [11.985, 3.825],
        [13.365, 3.825],
        [14.745, 3.825],
        [16.585, 3.825],
        [17.965, 3.825],
        [19.345, 3.825],
        [20.725, 3.825],
        [22.105, 3.825],
        [23.945, 3.825],
        [25.325, 3.825],
    ]
    magic_scale = 200
    via_delta = -0.69
    via_len = 0.17

    # Generate zero and one coordinates for each via
    llx_zero = []
    lly_zero = []
    urx_zero = []
    ury_zero = []
    llx_one = []
    lly_one = []
    urx_one = []
    ury_one = []

    zero_string = []
    one_string = []

    for i in range(0, 16):
        llx_zero = round(via_pos[i][0] * magic_scale)
        lly_zero = round(via_pos[i][1] * magic_scale)
        urx_zero = llx_zero + int(via_len * magic_scale)
        ury_zero = lly_zero + int(via_len * magic_scale)

        llx_one = llx_zero + int(via_delta * magic_scale)
        lly_one = lly_zero
        urx_one = urx_zero + int(via_delta * magic_scale)
        ury_one = ury_zero

        zero_string.append(
            "rect {:d} {:d} {:d} {:d}\n".format(llx_zero, lly_zero, urx_zero, ury_zero)
        )
        one_string.append(
            "rect {:d} {:d} {:d} {:d}\n".format(llx_one, lly_one, urx_one, ury_one)
        )
    return zero_string, one_string


def prepare_env(prj_path, magpath, vpath, glpath, user_defines_path):
    try:
        frigate_path = os.environ["FRIGATE_ROOT"]
    except:
        print("Warning:  FRIGATE_ROOT not set;  assuming the cwd.")
        frigate_path = os.getcwd()
    if not os.path.isdir(prj_path):
        print(
            'Error:  Project path "' + prj_path + '" does not exist or is not readable.'
        )
        sys.exit(1)

    # Check paths
    if not os.path.isdir(vpath):
        print("No directory " + vpath + " found (path to verilog).")
        sys.exit(1)

    if not os.path.isdir(glpath):
        print("No directory " + glpath + " found (path to gate-level verilog).")
        sys.exit(1)

    if not os.path.isdir(magpath):
        print("No directory " + magpath + " found (path to magic databases).")
        sys.exit(1)

    if not os.path.isfile(user_defines_path):
        user_defines_path = frigate_path + "/verilog/rtl/user_defines.v"
        if os.path.isfile(user_defines_path):
            print("Error:  No user_defines.v file found.")
            sys.exit(1)
    print(f"INFO: user defines path {user_defines_path}")

    return user_defines_path, frigate_path


def fixed_configs():
    gpio_configs_dict = {}
    gpio_configs_dict["`USER_CONFIG_GPIO_0_INIT"] = "16'h8c01"
    gpio_configs_dict["`USER_CONFIG_GPIO_1_INIT"] = "16'h9809"
    gpio_configs_dict["`USER_CONFIG_GPIO_2_INIT"] = "16'h8c01"
    gpio_configs_dict["`USER_CONFIG_GPIO_3_INIT"] = "16'h8801"
    gpio_configs_dict["`USER_CONFIG_GPIO_4_INIT"] = "16'h8c01"
    gpio_configs_dict["`USER_CONFIG_GPIO_5_INIT"] = "16'h9801"
    gpio_configs_dict["`USER_CONFIG_GPIO_6_INIT"] = "16'h9801"
    gpio_configs_dict["`USER_CONFIG_GPIO_7_INIT"] = "16'h8c01"
    gpio_configs_dict["`USER_CONFIG_GPIO_64_INIT"] = "16'h9801"
    gpio_configs_dict["`USER_CONFIG_GPIO_65_INIT"] = "16'h9801"
    return gpio_configs_dict


if __name__ == "__main__":
    main()
