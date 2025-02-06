// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`timescale 			1ns/1ps
`default_nettype 	none

module project_id_rom_32bit#(parameter USER_PROJECT_ID = 32'h0) (VPWR, VGND, gpio_defaults);
  input wire VGND;
  input wire VPWR;
  output wire [31:0] gpio_defaults;

  assign gpio_defaults = USER_PROJECT_ID;
endmodule
