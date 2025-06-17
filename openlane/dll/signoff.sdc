# SPDX-FileCopyrightText: 2020 Efabless Corporation
create_clock [get_pins {"ringosc.ibufp01/Y"} ] -name "dll_control_clock" -period 6.67
create_clock -name VIRTUAL_CLK -period 20

set_clock_groups \
   -name clock_group \
   -logically_exclusive \
   -group [get_clocks {dll_control_clock}]\
   -group [get_clocks {VIRTUAL_CLK}]

set_propagated_clock [get_clocks {dll_control_clock}] 

set_max_fanout 20 [current_design]
set_input_delay 3  -clock [get_clocks VIRTUAL_CLK] [all_inputs]
set_output_delay 3  -clock [get_clocks VIRTUAL_CLK] [all_outputs]

set_driving_cell -lib_cell $::env(SYNTH_DRIVING_CELL) -pin $::env(SYNTH_DRIVING_CELL_PIN) [all_inputs]
set_load  0.20 [all_outputs]

set_timing_derate -early [expr {1-0.05}]
set_timing_derate -late [expr {1+0.05}]

puts "\[INFO\]: Setting clock uncertainity to: 0.1"
set_clock_uncertainty 0.1 [get_clocks {dll_control_clock}]
