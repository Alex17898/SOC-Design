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

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32,
    parameter DELAYS=10
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    wire [31:0] rdata; 
    wire [31:0] wdata;
    reg [BITS-1:0] cnt;

    wire valid;
    wire [3:0] wstrb;
    wire [31:0] la_write;
    wire addr;

    reg ready;
    reg [BITS-17:0] wb_cnt;

    assign valid = wbs_cyc_i && wbs_stb_i && addr; 
    assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    assign wbs_dat_o = rdata;
    assign wdata = wbs_dat_i;
    assign wbs_ack_o = ready;
    assign io_out = cnt;
    assign io_oeb = {(`MPRJ_IO_PADS-1){~rst}};
    assign irq = 3'b000;	
    assign la_data_out = {{(127-BITS){1'b0}}, cnt};
    assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    assign addr = (wbs_adr_i[31:20] == 12'h380) ? 1'b1 : 1'b0;
    always @(posedge clk) begin
        if (rst) begin
            ready <= 1'b0;
            wb_cnt <= 16'b0;
        end 
        else begin
            ready <= 1'b0;
            if ( valid && !ready ) begin
                if ( wb_cnt == DELAYS ) begin
                    wb_cnt <= 16'b0;
                    ready <= 1'b1;
                end else begin
                    wb_cnt <= wb_cnt + 1;
                end
            end
        end
    end
    always @(posedge clk) begin
    	if (rst) begin
    	    cnt <= 0;
    	end 
    	else if (cnt == 0) begin
    	    if ((wbs_adr_i[31:20] == 12'h380) && valid && (|wstrb == 1'b0)) begin
    	        cnt <= cnt + 1;
    	    end else begin
    	        cnt <= cnt;
    	    end
    	end 
    	else begin
    	    cnt <= cnt + 1;
    	end
    end
    bram user_bram (
        .CLK(clk),
        .WE0(wstrb),
        .EN0(valid),
        .Di0(wbs_dat_i),
        .Do0(rdata),
        .A0(wbs_adr_i)
    );

endmodule

`default_nettype wire
