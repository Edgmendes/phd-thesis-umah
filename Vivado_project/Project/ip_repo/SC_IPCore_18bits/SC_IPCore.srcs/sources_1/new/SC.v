`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 16:30:24
// Design Name: 
// Module Name: SC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SC #(
    parameter integer NSONARS = 248,
    parameter integer NCOORDS = 3,
    parameter integer AXI_DATA_BITS = 32,
    parameter integer DATA_BITS = 18,
    parameter integer ADDR_BITS = 12,    // 10 bits for address and 2 bits for integer offset
    parameter debug = 0  
)(
    input wire s_axi_aclk,
    input wire s_axi_aresetn,
    input wire [ADDR_BITS-1 : 0] s_axi_awaddr,
    input wire [2 : 0] s_axi_awprot,
    input wire s_axi_awvalid,
    output wire s_axi_awready,
    input wire [AXI_DATA_BITS-1 : 0] s_axi_wdata,
    input wire [3 : 0] s_axi_wstrb,
    input wire s_axi_wvalid,
    output wire s_axi_wready,
    output wire [1 : 0] s_axi_bresp,
    output wire s_axi_bvalid,
    input wire s_axi_bready,
    input wire [ADDR_BITS-1 : 0] s_axi_araddr,
    input wire [2 : 0] s_axi_arprot,
    input wire s_axi_arvalid,
    output wire s_axi_arready,
    output wire [AXI_DATA_BITS-1 : 0] s_axi_rdata,
    output wire [1 : 0] s_axi_rresp,
    output wire s_axi_rvalid,
    input wire s_axi_rready,
    
    input enable,
    input set_src_pos,
    output reg set_outputs,
    
    output [DATA_BITS*NCOORDS*NSONARS-1:0] sonar_dst,	// Focal Point position 
    output reg [DATA_BITS*NCOORDS*NSONARS-1:0] sonar_src,
    
    input [DATA_BITS-1:0] dst_x,   // X coordinate position
    input [DATA_BITS-1:0] dst_y,   // Y coordinate position
    input [DATA_BITS-1:0] dst_z,   // Z coordinate position
    
    input [DATA_BITS-1:0] nsonar_dbg,
    output wire [AXI_DATA_BITS-1:0] src_dbg_x,    // Sonar source X axis Debug signal
    output wire [AXI_DATA_BITS-1:0] src_dbg_y,    // Sonar source Y axis Debug signal
    output wire [AXI_DATA_BITS-1:0] src_dbg_z,    // Sonar source Z axis Debug signal
    output wire [AXI_DATA_BITS-1:0] dst_dbg_x,    // Focal Point X axis Debug signal
    output wire [AXI_DATA_BITS-1:0] dst_dbg_y,    // Focal Point Y axis Debug signal
    output wire [AXI_DATA_BITS-1:0] dst_dbg_z    // Focal Point Z axis Debug signal
);
wire bram_rst_a;
wire bram_clk_a;
wire ena;
wire [0 : 0] wea;
wire [ADDR_BITS-1 : 0] bram_addr_a;
wire [AXI_DATA_BITS-1 : 0] dina;
wire [AXI_DATA_BITS-1 : 0] douta;
wire [0 : 0] web;
reg [9 : 0] addrb;
wire [AXI_DATA_BITS-1 : 0] dinb;
wire [AXI_DATA_BITS-1 : 0] doutb;

//----------------------------Focal Point destination Position----------------------------------//
reg [DATA_BITS*NCOORDS-1:0] distance_dst;

always@(posedge s_axi_aclk)begin
    if(!s_axi_aresetn)begin
        distance_dst <= 0;
    end
    else begin
        distance_dst <= {dst_x,dst_y,dst_z};
    end
end

//Position of the Focal Point interface (SW application)
genvar j;
generate
    for(j = 0; j < NSONARS; j = j+1) begin : GEN_BLOCK_dst
        assign sonar_dst[(j+1)*(DATA_BITS*NCOORDS)-1 -: DATA_BITS*NCOORDS] = distance_dst ;
    end
endgenerate

//----------------------------Set Position of Ultrasounds in PCB----------------------------------//
wire mem_ready;
localparam integer READ_DELAY = 3;
reg [31:0] delay;

assign mem_ready = ( (bram_addr_a>>2) == (NSONARS*NCOORDS) ) ? 1 : 0;

always@(posedge s_axi_aclk)begin
    if(!s_axi_aresetn)begin
        delay <= 0;
        sonar_src <= 0;
        addrb <= 0;
    end
    else begin
        if(set_src_pos)begin
            if(addrb <= (NSONARS*NCOORDS)-1)begin
                if(delay == READ_DELAY)begin
                    addrb <= addrb + 1;
                    delay <= 0;
                    sonar_src[(DATA_BITS*(addrb+1))-1 -: DATA_BITS] <= doutb;
                end
                else begin
                    delay <= delay +1;
                    addrb <= addrb;
                    sonar_src <= sonar_src;
                end
            end
        end    
     end
end

//----------------------------Debug----------------------------------// 

if( debug == 1) begin

    reg [AXI_DATA_BITS-1:0] src_dbg_reg_x, src_dbg_reg_y, src_dbg_reg_z;
    reg [AXI_DATA_BITS-1:0] dst_dbg_reg_x, dst_dbg_reg_y, dst_dbg_reg_z;
    
    always@( posedge s_axi_aclk ) begin
        if(!s_axi_aresetn)begin
            src_dbg_reg_x <= 0;
            src_dbg_reg_y <= 0;
            src_dbg_reg_z <= 0;
            dst_dbg_reg_x <= 0;
            dst_dbg_reg_y <= 0;
            dst_dbg_reg_z <= 0;
        end
        else begin
            src_dbg_reg_x <= sonar_src[nsonar_dbg*DATA_BITS*3-1 -: DATA_BITS];
            src_dbg_reg_y <= sonar_src[(nsonar_dbg*DATA_BITS*3)-DATA_BITS-1 -: DATA_BITS];
            src_dbg_reg_z <= sonar_src[(nsonar_dbg*DATA_BITS*3)-DATA_BITS*2-1 -: DATA_BITS];        
            dst_dbg_reg_x <= sonar_dst[nsonar_dbg*DATA_BITS*3-1 -: DATA_BITS];
            dst_dbg_reg_y <= sonar_dst[(nsonar_dbg*DATA_BITS*3)-DATA_BITS-1 -: DATA_BITS];
            dst_dbg_reg_z <= sonar_dst[(nsonar_dbg*DATA_BITS*3)-DATA_BITS*2-1 -: DATA_BITS];
         end
    end

    assign src_dbg_x = src_dbg_reg_x;
    assign src_dbg_y = src_dbg_reg_y;
    assign src_dbg_z = src_dbg_reg_z;
    
    assign dst_dbg_x = dst_dbg_reg_x;
    assign dst_dbg_y = dst_dbg_reg_y;
    assign dst_dbg_z = dst_dbg_reg_z;
end

//-------------------------Set Outputs---------------------------------//
always@ (posedge s_axi_aclk) begin
    if(!s_axi_aresetn) begin
        set_outputs <= 0;
    end
    else begin
        set_outputs <= (enable) ? 1 : 0;
    end
end

//-------------------------Memory Controller---------------------------------//

axi_bram_ctrl_sc axi_controller (
  .s_axi_aclk(s_axi_aclk),        // input wire s_axi_aclk
  .s_axi_aresetn(s_axi_aresetn),  // input wire s_axi_aresetn
  .s_axi_awaddr(s_axi_awaddr),    // input wire [11 : 0] s_axi_awaddr
  .s_axi_awprot(s_axi_awprot),    // input wire [2 : 0] s_axi_awprot
  .s_axi_awvalid(s_axi_awvalid),  // input wire s_axi_awvalid
  .s_axi_awready(s_axi_awready),  // output wire s_axi_awready
  .s_axi_wdata(s_axi_wdata),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(s_axi_wstrb),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(s_axi_wvalid),    // input wire s_axi_wvalid
  .s_axi_wready(s_axi_wready),    // output wire s_axi_wready
  .s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(s_axi_bready),    // input wire s_axi_bready
  .s_axi_araddr(s_axi_araddr),    // input wire [11 : 0] s_axi_araddr
  .s_axi_arprot(s_axi_arprot),    // input wire [2 : 0] s_axi_arprot
  .s_axi_arvalid(s_axi_arvalid),  // input wire s_axi_arvalid
  .s_axi_arready(s_axi_arready),  // output wire s_axi_arready
  .s_axi_rdata(s_axi_rdata),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(s_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(s_axi_rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(s_axi_rready),    // input wire s_axi_rready
  .bram_rst_a(bram_rst_a),        // output wire bram_rst_a
  .bram_clk_a(bram_clk_a),        // output wire bram_clk_a
  .bram_en_a(ena),          // output wire bram_en_a
  .bram_we_a(wea),          // output wire [3 : 0] bram_we_a
  .bram_addr_a(bram_addr_a),      // output wire [11 : 0] bram_addr_a
  .bram_wrdata_a(dina),  // output wire [31 : 0] bram_wrdata_a
  .bram_rddata_a(douta)  // input wire [31 : 0] bram_rddata_a
);    

blk_mem_gen_sc memory (
  .clka(bram_clk_a),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(bram_addr_a>>2),  // input wire [9 : 0] addra
  .dina(dina),    // input wire [31 : 0] dina
  .douta(douta),  // output wire [31 : 0] douta
  .clkb(bram_clk_a),    // input wire clkb
  .web(0),      // input wire [0 : 0] web
  .addrb(addrb),  // input wire [9 : 0] addrb
  .dinb(dinb),    // input wire [31 : 0] dinb
  .doutb(doutb)  // output wire [31 : 0] doutb
);
    
endmodule
