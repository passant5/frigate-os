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

`ifndef __GLOBAL_DEFINE_H
// Global parameters
`define __GLOBAL_DEFINE_H

`define MPRJ_IO_PADS_1 33	/* number of user GPIO pads on user1 side */
`define MPRJ_IO_PADS_2 33	/* number of user GPIO pads on user2 side */
`define MPRJ_IO_PADS (`MPRJ_IO_PADS_1 + `MPRJ_IO_PADS_2)

`define USE_PG_PIN
`ifndef ENABLE_SDF
`define functional // to disable ram timing checkers in non sdf sims
`endif
`endif // __GLOBAL_DEFINE_H