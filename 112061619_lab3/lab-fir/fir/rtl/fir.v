`timescale 1ns / 1ps
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
    output  reg  [3:0]               data_WE,
    output  wire                     data_EN,
    output  wire [(pDATA_WIDTH-1):0] data_Di,
    output  wire [(pADDR_WIDTH-1):0] data_A,
    input   wire [(pDATA_WIDTH-1):0] data_Do,

    input   wire                     axis_clk,
    input   wire                     axis_rst_n
);

wire [(pADDR_WIDTH-1):0]addr;
wire [(pDATA_WIDTH-1):0]ap_ctrl,mul;

wire wen,awen,ren,aren;
reg [(pDATA_WIDTH-1):0]data_length;
reg [(pDATA_WIDTH-1):0]cnt;
reg [(pDATA_WIDTH-1):0]temp;
reg [(pADDR_WIDTH-1):0]mul_cnt,i_cnt,sm_cnt,offset,j_cnt;

reg ap_done;
wire ap_start;
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

assign tap_WE=((wen&awen)&((awaddr>=12'h20)))?4'b1111:4'b0000;
assign tap_EN=(((wen&awen)|(ren&aren))&((addr>=12'h20))|(ap_start))?1'b1:1'b0;
assign tap_Di=(wen&((awaddr>=12'h20)))?wdata:tap_Di;
assign tap_A=(tap_EN)?(!ap_start)?addr-12'h20:i_cnt:tap_A;


always@(posedge axis_clk)begin
    if(ss_tready)begin
        data_WE<=4'b1111;
    end
    else begin
        data_WE<=4'b0000;
    end
end

assign data_EN=(ss_tvalid&ss_tready|(!ss_tlast)|ap_start)?1'b1:1'b0;
assign data_Di=(data_EN)?ss_tdata:data_Di;
assign data_A=(data_EN)?(!ap_start)?12'h00:mul_cnt:12'd40;

assign ap_start=((awaddr==12'h00)&(wdata[0]==1'b1)&awen)?1'b1:1'b0;

always@(posedge axis_clk)begin
	if(wen&awen&(awaddr==12'h10))begin
		data_length<=wdata;
	end
	else begin
		data_length<=data_length;
	end
end

always@(posedge axis_clk)begin
	if(!axis_rst_n)begin
		cnt<=32'd0;
		ap_done<=1'b0;
		sm_tlast<=1'b0;
	end
	else if(cnt==32'd7200)begin
		cnt<=cnt;
		ap_done<=1'b1;
		sm_tlast<=1'b1;
	end
	else if(ap_start) begin
		cnt<=cnt+32'b1;
		ap_done<=1'b0;
		sm_tlast<=1'b0;
	end
end

always@(posedge axis_clk)begin
	if(!axis_rst_n)begin
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
	else if(ap_start)begin
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
    else if(ap_start)begin
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
    else begin
        sm_cnt<=sm_cnt+12'd1;
        sm_tvalid<=1'b0;
    end
end

assign ss_tready=(ap_start&ap_idle)|sm_tvalid;

always@(posedge axis_clk)begin
    if((~axis_rst_n)|(offset>12'd10))begin
        offset<=12'd0;
    end
    else if(ss_tready)begin
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
    else if(ss_tready)begin
        mul_cnt<=12'h28-offset*4;
    end
    else if(mul_cnt<12'h28)begin
        mul_cnt<=mul_cnt+12'd4;
    end
    else begin
        mul_cnt<=12'h0;
    end
end

always@(posedge axis_clk)begin
    if(~axis_rst_n)begin
        j_cnt<=12'd0;
    end
    else if(ss_tready)begin
        j_cnt<=j_cnt+12'd1;
    end
    else if(j_cnt>12'd11)begin
        j_cnt<=j_cnt;
    end
    else begin
        j_cnt<=j_cnt;
    end
end

endmodule