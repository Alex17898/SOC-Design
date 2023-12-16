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

    // Logic Analyzer Signals          ////???????????????
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs                                   ////???????????????
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
    reg [BITS-1:0] count;

    wire valid;
    wire [3:0] wstrb;
    wire [31:0] la_write;
    wire addr;

    reg ready,endmark;
    reg [BITS-17:0] delayed_count;
    
    wire awready,wready,val,arready,rvalid,ss_tvalid,ss_tready,sm_tvalid,sm_tlast,tap_EN,data_EN;
    reg [11:0]awaddr;
    wire [11:0]tap_A,data_A;
    wire [31:0]fir_rdata,sm_tdata,tap_Di,tap_Do,data_Di,data_Do;
    wire [3:0]tap_WE,data_WE;
    
    parameter [2:0]S0=0;            ////???????????????
    parameter [2:0]S1=1;
    parameter [2:0]S2=2;
    parameter [2:0]S3=3;
    parameter [2:0]S4=4;
    reg [2:0]state,next_state;
    reg [31:0]tap_cnt,register;

    // WB MI A
    assign valid = wbs_cyc_i && wbs_stb_i && addr;     ////???????????????why addr
    assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    assign wbs_dat_o = (wbs_adr_i[31:20] == 12'h300&state==S3)?register:(wbs_adr_i[31:20] == 12'h300)?sm_tdata:rdata;
    assign wdata = wbs_dat_i;
    assign wbs_ack_o = ready;

    // IO                        ////???????????????
    assign io_out = count;
    assign io_oeb = {(`MPRJ_IO_PADS-1){~rst}};

    // IRQ
    assign irq = 3'b000;	// Unused

    // LA                                                ////???????????????
    assign la_data_out = {{(127-BITS){1'b0}}, count};
    // Assuming LA probes [63:32] are for controlling the count register  
    assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;

    assign addr = (wbs_adr_i[31:20] == 12'h380|wbs_adr_i[31:20] == 12'h300) ? 1'b1 : 1'b0;
    
    always@(posedge clk)begin
      if(rst)begin
        register<=32'd0;
      end
      else if((wbs_adr_i[31:20] == 12'h300)&sm_tvalid&(~val))begin   ////val ????????
        register<=sm_tdata;
      end
      else begin
        register<=register;
      end
    end
    always @(posedge clk) begin
        if (rst) begin
            ready <= 1'b0;
            delayed_count <= 16'b0;
        end 
        else begin
            ready <= 1'b0;
            if ( valid && !ready ) begin
                if ( delayed_count == DELAYS ) begin
                    delayed_count <= 16'b0;
                    ready <= 1'b1;
                end else begin
                    delayed_count <= delayed_count + 1;
                end
            end
        end
    end
    
    always @(posedge clk) begin   //////////????????????????????
    	if (rst) begin
    	    count <= 0;
    	    endmark<=0;
    	end 
    	else if (count == 0) begin
    	    if ((io_in[23:16]==8'hA5) && valid && (|wstrb == 1'b0)) begin
    	        count <= count + 1;
    	    end else begin
    	        count <= count;
    	    end
    	end 
    	else if((io_in[23:16]==8'h5A)|endmark)begin
    	    count <= count;
    	    endmark<=1;
    	end
    	else begin
    	    count <= count + 1;
    	end
    end
    
always@(posedge clk)begin      //////////////////??????????????????
  if(rst)begin
    state<=S0;
  end
  else begin
    state<=next_state;
    case(state)
      S0:awaddr=wbs_adr_i[11:0];
      S1:awaddr=(tap_cnt<32'd11)?12'h20+tap_cnt*4:12'h10;
      S2:awaddr=12'h20+tap_cnt*4;
      S3:awaddr=32'd0;
      S4:awaddr=32'd0;
    endcase
  end
end

always@(*)begin         ////?????????val??????
  case(state)
    S0:next_state=(val)?S1:S0;
    S1:next_state=(tap_cnt==32'd12)?S2:S1;
    S2:next_state=((wbs_adr_i[31:20] == 12'h300)&wbs_ack_o)?S3:S2;
    S3:next_state=(sm_tlast)?S4:(~((wbs_adr_i[31:20] == 12'h300)&wbs_ack_o))?S3:S2;
    S4:next_state=S4;
  endcase
end

always@(posedge clk)begin
  if(rst)begin
    tap_cnt<=32'd0;
  end
  else if(val&wbs_ack_o&state==S1) begin
    tap_cnt<=tap_cnt+32'd1;
  end
  else begin
    tap_cnt<=tap_cnt;
  end
end
assign val=(wbs_adr_i==32'h30000000&valid)?1'b1:1'b0; ///////??????????????
assign ss_tvalid=(state==S2&val)?1'b1:1'b0;  ///////??????????????


fir user_fir(
.awready(awready),
.wready(wready),
.awvalid(val),
.awaddr(awaddr),
.wvalid(val),
.wdata(wbs_dat_i),
.arready(arready),
.rready(1'b0),
.arvalid(1'b0),
.araddr(12'd0),
.rvalid(rvalid),
.rdata(fir_rdata),   
.ss_tvalid(ss_tvalid), 
.ss_tdata(wbs_dat_i), 
.ss_tlast(1'b0), 
.ss_tready(ss_tready), 
.sm_tready(1'b1), 
.sm_tvalid(sm_tvalid), 
.sm_tdata(sm_tdata), 
.sm_tlast(sm_tlast), 
.tap_WE(tap_WE),
.tap_EN(tap_EN),
.tap_Di(tap_Di),
.tap_A(tap_A),
.tap_Do(tap_Do),
.data_WE(data_WE),
.data_EN(data_EN),
.data_Di(data_Di),
.data_A(data_A),
.data_Do(data_Do),
.axis_clk(clk),
.axis_rst_n(rst),
.state(state),
.wbs_ack_o(wbs_ack_o)
);

    // RAM for tap
    bram11 tap_RAM (
        .CLK(clk),
        .WE(tap_WE),
        .EN(tap_EN),
        .Di(tap_Di),
        .A(tap_A),
        .Do(tap_Do)
    );

    // RAM for data: choose bram11 or bram12
    bram11 data_RAM(
        .CLK(clk),
        .WE(data_WE),
        .EN(data_EN),
        .Di(data_Di),
        .A(data_A),
        .Do(data_Do)
    );

    bram user_bram (
        .CLK(clk),
        .WE0(wstrb),
        .EN0(valid),
        .Di0(wbs_dat_i),
        .Do0(rdata),
        .A0(wbs_adr_i)
    );

endmodule
//////////////////////////////////////////////////////////////////////////////
module fir 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
)
(
    output  wire                     awready,
    output  wire                     wready,
	
    input   wire                     awvalid,
    input   wire [(pADDR_WIDTH-1):0] awaddr,
    input   wire                     wvalid,
    input   wire [(pDATA_WIDTH-1):0] wdata,
//w
    output  wire                     arready,
	
    input   wire                     rready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,
	
    output  wire                     rvalid,
    output  reg  [(pDATA_WIDTH-1):0] rdata,   
//R
    input   wire                     ss_tvalid, 
    input   wire [(pDATA_WIDTH-1):0] ss_tdata, 
    input   wire                     ss_tlast, 
	
    output  wire                     ss_tready, 
//slave
    input   wire                     sm_tready, 
	
    output  reg                      sm_tvalid, 
    output  wire [(pDATA_WIDTH-1):0] sm_tdata, 
    output  reg                      sm_tlast, 
//master    
	
    // bram for tap RAM
    output  wire [3:0]               tap_WE,
    output  wire                     tap_EN,
    output  wire  [(pDATA_WIDTH-1):0] tap_Di,
    output  wire  [(pADDR_WIDTH-1):0] tap_A,
    input   wire  [(pDATA_WIDTH-1):0] tap_Do,

    // bram for data RAM
    output  wire [3:0]               data_WE,
    output  wire                     data_EN,
    output  wire [(pDATA_WIDTH-1):0] data_Di,
    output  wire [(pADDR_WIDTH-1):0] data_A,
    input   wire [(pDATA_WIDTH-1):0] data_Do,

    input   wire                     axis_clk,
    input   wire                     axis_rst_n,
    input   wire [2:0]               state,
    input   wire                     wbs_ack_o
);

wire [(pADDR_WIDTH-1):0]addr;
wire [(pDATA_WIDTH-1):0]ap_ctrl,mul;
reg [3:0]data__WE;

wire wen,awen,ren,aren,ap_start;
reg [(pDATA_WIDTH-1):0]data_length;
reg [(pDATA_WIDTH-1):0]cnt;
reg [(pDATA_WIDTH-1):0]temp;
reg [(pADDR_WIDTH-1):0]mul_cnt,i_cnt,sm_cnt,offset,j_cnt;

reg ap_done;

reg ap_idle;

assign wen=(wvalid&wready)?1'b1:1'b0;
assign awen=(awvalid&awready)?1'b1:1'b0;
assign ren=(rvalid&rready)?1'b1:1'b0;
assign aren=(arvalid&arready)?1'b1:1'b0;

assign wready=(wvalid)?1'b1:1'b0;
assign awready=(awvalid)?1'b1:1'b0;

assign rvalid=((!wvalid)&(!wready))?1'b1:1'b0;
assign arready=((!wvalid)&(!wready))?1'b1:1'b0;

assign addr=(awen|aren)?(awen)?awaddr:araddr:addr;

assign tap_WE=((wen&awen)&((awaddr>=12'h20))&state==1)?4'b1111:4'b0000;
assign tap_EN=(((wen&awen)|(ren&aren))&((addr>=12'h20))|(ap_start))?1'b1:1'b0;
assign tap_Di=(wen&((awaddr>=12'h20)))?wdata:tap_Di;
assign tap_A=(tap_EN)?(!ap_start)?addr-12'h20:i_cnt:tap_A;

assign ap_start=(state==2|state==3)?1'b1:1'b0;
assign data_WE=(cnt==0&wvalid&state==2)?4'b1111:data__WE;
always@(posedge axis_clk)begin
    if(ss_tready&wvalid&state==2)begin
        data__WE<=4'b1111;
    end
    else begin
        data__WE<=4'b0000;
    end
end

assign data_EN=(ss_tvalid&ss_tready|(!ss_tlast)|ap_start)?1'b1:1'b0;
assign data_Di=(data_EN)?ss_tdata:data_Di;
assign data_A=(data_EN)?(!ap_start)?12'h00:mul_cnt:12'd40;



always@(posedge axis_clk)begin
	if(wen&awen&(awaddr==12'h10))begin
		data_length<=wdata;
	end
	else begin
		data_length<=data_length;
	end
end

always@(posedge axis_clk)begin
	if(axis_rst_n)begin
		cnt<=32'd0;
		ap_done<=1'b0;
		sm_tlast<=1'b0;
	end
	else if(cnt==data_length*12&state==3&wbs_ack_o)begin
		cnt<=cnt;
		ap_done<=1'b1;
		sm_tlast<=1'b1;
	end
	else if(ap_start&wvalid&state==2) begin
		cnt<=cnt+32'b1;
		ap_done<=1'b0;
		sm_tlast<=1'b0;
	end
	else begin
	       sm_tlast<=1'b0;
	end
end

always@(posedge axis_clk)begin
	if(axis_rst_n)begin
		ap_idle<=1'b1;
	end
	else if(ap_done)begin
		ap_idle<=1'b1;
	end
	else if(ap_start)begin
		ap_idle<=1'b0;
	end
	else begin
		ap_idle<=1'b1;
	end
end

assign ap_ctrl={29'd0,ap_idle,ap_done,ap_start};


always@(*)begin
	if(ren&aren)begin
		if(araddr==12'h00)begin
			rdata<=ap_ctrl;
		end
		else if(araddr>=12'h20)begin
			rdata<=tap_Do;
		end
		else begin
			rdata<=rdata;
		end
	end
end

assign mul=((sm_cnt>1)&(sm_cnt<=j_cnt+12'd1))?data_Do:32'd0;

always@(posedge axis_clk)begin
	if(ap_idle|ss_tready)begin
		temp<=32'd0;
	end
	else if(ap_start&wvalid)begin
		temp<=temp+mul*tap_Do;
	end
	else begin
		temp<=temp;
	end
end

assign sm_tdata=(sm_tvalid&sm_tready)?temp:sm_tdata;


always@(posedge axis_clk)begin
    if(i_cnt==12'd0|ss_tready)begin
        i_cnt<=12'h28;
    end
    else if(ap_start&wvalid)begin
        i_cnt<=i_cnt-12'd4;
    end
    else begin
        i_cnt<=12'h28;
    end
end

always@(posedge axis_clk)begin
    if(~ap_start)begin
        sm_cnt<=12'd0;
        sm_tvalid<=1'b0;
    end
    else if(sm_cnt>12'd10)begin
        sm_cnt<=12'd0;
        sm_tvalid<=1'b1;
    end
    else if(wvalid)begin
        sm_cnt<=sm_cnt+12'd1;
        sm_tvalid<=1'b0;
    end
end

assign ss_tready=(ap_start&ap_idle)|sm_tvalid;

always@(posedge axis_clk)begin
    if((axis_rst_n)|(offset>12'd10))begin
        offset<=12'd0;
    end
    else if(ss_tready&wvalid&state==2)begin
        offset<=offset+12'd1;
    end
    else begin
        offset<=offset;
    end
end

always@(posedge axis_clk)begin
    if(~ap_start)begin
        mul_cnt<=12'd28;
    end
    else if(ss_tready&wvalid&state==2)begin
        mul_cnt<=12'h28-offset*4;
    end
    else if(mul_cnt<12'h28&wvalid&state==2)begin
        mul_cnt<=mul_cnt+12'd4;
    end
    else begin
        mul_cnt<=12'h0;
    end
end

always@(posedge axis_clk)begin
    if(axis_rst_n)begin
        j_cnt<=12'd1;
    end
    else if(ss_tready&wvalid&state==2)begin
        j_cnt<=j_cnt+12'd1;
    end
    else if(j_cnt>12'd11&wvalid&state==2)begin
        j_cnt<=j_cnt;
    end
    else begin
        j_cnt<=j_cnt;
    end
end

endmodule

`default_nettype wire
