// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Tue Dec 19 08:55:26 2023
// Host        : ubuntu2004 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/ubuntu/caravel-soc_fpga-lab-main/Final/Final/lab-wlos_baseline/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_0/design_1_blk_mem_gen_0_0_sim_netlist.v
// Design      : design_1_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_blk_mem_gen_0_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module design_1_blk_mem_gen_0_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  design_1_blk_mem_gen_0_0_blk_mem_gen_v8_4_5 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 59888)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
