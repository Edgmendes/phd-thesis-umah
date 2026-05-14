`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2023 18:18:49
// Design Name: 
// Module Name: Post_modulator
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


module Post_modulator(
    input clk,
    input reset,
    input enable,
    input [247:0] signal_in,
    input resync,
    input [31:0] n_cycles_on,
    output [247:0] signal_out
    );
    
    reg [247:0] s_in;
       
    always@(posedge clk) begin
        if(reset)begin
            s_in <= 0;
         end
         else begin
            s_in <= signal_in;
         end
    end
    
    reg  en_reg;
    reg  resync_reg;
	reg [31:0] n_cycles_reg;
       
    always@(posedge clk) begin
        if(reset)begin
            en_reg <= 0;
            resync_reg <= 0;
			n_cycles_reg <= 0;
        end
        else begin
            en_reg <= enable;
            resync_reg <= resync;
			n_cycles_reg <= n_cycles_on;
        end
    end
    
    reg [31:0] counter;
    reg flag_mask;
    
    always @ (posedge clk) begin
        if(reset)begin
            flag_mask <= 0;
        end
        else begin
            if(resync_reg)begin
                flag_mask <= 1;         
            end
            else begin
                if(counter == n_cycles_reg) begin
					flag_mask <= 0;
                end
                else begin
					flag_mask <= flag_mask;
                end
            end
        end
    end
    
    always @(posedge clk) begin
        if(reset) begin
            counter <= 0;
        end
        else begin
            if(resync_reg) begin
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
    
    reg [247:0] s_out;
    
    assign signal_out = s_out;
    
    always @(posedge clk)begin
        if(reset)begin
            s_out <= 0;
        end
        else begin
            if(en_reg)begin
                if(flag_mask)
                    s_out <= s_in;
                else
                    s_out <= 0;
            end
            else begin
                s_out <= s_in;       
            end
        end
    end
    
endmodule
