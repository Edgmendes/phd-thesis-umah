`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2019 11:08:01
// Design Name: 
// Module Name: tb
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


module tb();

localparam NSONARS = 1;
localparam NCOORDS = 3;
localparam DATA_BITS = 12;
localparam AXI_DATA_BITS = 32;
localparam ADDR_BITS = 12;    // 10 bits for address and 2 bits for integer offset

reg s_axi_aclk;
reg s_axi_aresetn;
reg [ADDR_BITS-1 : 0] s_axi_awaddr;
reg[2 : 0] s_axi_awprot;
reg s_axi_awvalid;
wire s_axi_awready;
reg [AXI_DATA_BITS-1 : 0] s_axi_wdata;
reg [3 : 0] s_axi_wstrb;
reg s_axi_wvalid;
wire s_axi_wready;
wire [1 : 0] s_axi_bresp;
wire s_axi_bvalid;
reg s_axi_bready;
reg [ADDR_BITS-1 : 0] s_axi_araddr;
reg [2 : 0] s_axi_arprot;
reg s_axi_arvalid;
wire s_axi_arready;
wire [AXI_DATA_BITS-1 : 0] s_axi_rdata;
wire [1 : 0] s_axi_rresp;
wire s_axi_rvalid;
reg s_axi_rready;

reg enable;
wire set_outputs;

wire [DATA_BITS*NCOORDS*NSONARS-1:0] sonar_dst;	// Focal Point position 
wire [DATA_BITS*NCOORDS*NSONARS-1:0] sonar_src;

reg [DATA_BITS-1:0] dst_x;   // X coordinate position
reg [DATA_BITS-1:0] dst_y;   // Y coordinate position
reg [DATA_BITS-1:0] dst_z;   // Z coordinate position

reg [AXI_DATA_BITS-1:0] nsonar_dbg;
wire [AXI_DATA_BITS-1:0] src_dbg_x;    // Sonar source X axis Debug signal
wire [AXI_DATA_BITS-1:0] src_dbg_y;    // Sonar source Y axis Debug signal
wire [AXI_DATA_BITS-1:0] src_dbg_z;    // Sonar source Z axis Debug signal
wire [AXI_DATA_BITS-1:0] dst_dbg_x;    // Focal Point X axis Debug signal
wire [AXI_DATA_BITS-1:0] dst_dbg_y;    // Focal Point Y axis Debug signal
wire [AXI_DATA_BITS-1:0] dst_dbg_z;   // Focal Point Z axis Debug signal

reg set_src_pos;

SC #(
    .NSONARS(NSONARS)
)uut(
    .s_axi_aclk(s_axi_aclk),
    .s_axi_aresetn(s_axi_aresetn),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    
    .enable(enable),
    .set_src_pos(set_src_pos),
    .set_outputs(set_outputs),
    
    .sonar_dst(sonar_dst),	// Focal Point position 
    .sonar_src(sonar_src),
    
    .dst_x(dst_x),   // X coordinate position
    .dst_y(dst_y),   // Y coordinate position
    .dst_z(dst_z),   // Z coordinate position
    
    .nsonar_dbg(nsonar_dbg),
    .src_dbg_x(src_dbg_x),    // Sonar source X axis Debug signal
    .src_dbg_y(src_dbg_y),    // Sonar source Y axis Debug signal
    .src_dbg_z(src_dbg_z),    // Sonar source Z axis Debug signal
    .dst_dbg_x(dst_dbg_x),    // Focal Point X axis Debug signal
    .dst_dbg_y(dst_dbg_y),    // Focal Point Y axis Debug signal
    .dst_dbg_z(dst_dbg_z)    // Focal Point Z axis Debug signal
);

always@(s_axi_aclk)begin
    s_axi_aclk <= #5 ~s_axi_aclk;
end  

initial begin
    //clocks and resets
    s_axi_aclk <= 0;
    s_axi_aresetn <= 0;
    
    //axi address write
    s_axi_awprot <= 0;
    
    //axi write data
    s_axi_wstrb <= 4'b1111;
    
    //axi address read
    s_axi_araddr <= 0;
    s_axi_arprot <= 0;
    s_axi_arvalid <= 0;
    
    //axi read data
    s_axi_rready <= 0;
    
    s_axi_awaddr <= 0;
    s_axi_awvalid <= 0;
    s_axi_wvalid <= 0;
    s_axi_wdata <= 0;
    
    enable <= 0;
    
    dst_x <= 12'd0;
    dst_y <= 12'd0;
    dst_z <= 12'd0;
    
    nsonar_dbg <= 1;
    
    set_src_pos <= 0;
    
    #500
    s_axi_aresetn <= 1;
    
    #500
    s_axi_awaddr <= 0;
    s_axi_wdata <= 32'h10;
    #50
    s_axi_awvalid <= 1;
    s_axi_wvalid <= 1;
    #50
    s_axi_awvalid <= 0;
    s_axi_wvalid <= 0;
    
    #500
    s_axi_awaddr <= s_axi_awaddr + 32'h4;
    s_axi_wdata <= 32'h20;
    #50
    s_axi_awvalid <= 1;
    s_axi_wvalid <= 1;
    #50
    s_axi_awvalid <= 0;
    s_axi_wvalid <= 0;
    
    #500
    s_axi_awaddr <= s_axi_awaddr + 32'h4;
    s_axi_wdata <= 32'h30;
    #50
    s_axi_awvalid <= 1;
    s_axi_wvalid <= 1;
    #50
    s_axi_awvalid <= 0;
    s_axi_wvalid <= 0;
    
    #500
    set_src_pos <= 1;
    
    #500
    dst_x <= 12'ha;
    dst_y <= 12'hb;
    dst_z <= 12'hc;
    
    #500
    enable <= 1;
    
    #2000
    nsonar_dbg <= 1;

end


//localparam DELAY = 10;
//reg [31:0] count;
//always@(posedge s_axi_aclk )begin
//    if(!s_axi_aresetn)begin
//        s_axi_awaddr <= 0;
//        s_axi_awvalid <= 0;
//        s_axi_wvalid <= 0;
//        s_axi_wdata <= 0;
//        count <= 0;
//    end
//    else begin
//        if(count == 0)begin
//            s_axi_awaddr <= s_axi_awaddr + 32'h4;
//            s_axi_wdata <= s_axi_wdata + 1;
//            s_axi_awvalid <= 1;
//            s_axi_wvalid <= 1;
//            count <= count + 1;
//        end
//        else if (count == 2) begin
//            s_axi_awvalid <= 0;
//            s_axi_wvalid <= 0;
//            count <= count + 1;
//        end
//        else if(count == 10)begin
//            count <= 0;
//        end
//        else
//            count <= count + 1;
//    end
//end

endmodule
