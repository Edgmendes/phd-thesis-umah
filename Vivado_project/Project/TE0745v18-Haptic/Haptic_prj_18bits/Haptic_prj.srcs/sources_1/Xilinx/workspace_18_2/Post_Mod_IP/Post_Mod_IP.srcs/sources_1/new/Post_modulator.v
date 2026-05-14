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
    input signal_in,
    input flag_sync,
    input [31:0] n_cycles_on,
    output signal_out
    );
    
    reg s_in;
       
    always@(posedge clk) begin
        if(reset)begin
            s_in <= 0;
         end
         else begin
            s_in <= signal_in;
         end
    end
    
    reg [31:0] counter;
    reg flag_mask;
    
    always @ (posedge clk) begin
        if(reset)begin
            flag_mask <= 0;
        end
        else begin
            if(flag_sync) begin
                flag_mask <= 1;
            end
            else if (counter == n_cycles_on) begin
                flag_mask <= 0;
            end
            else begin
                flag_mask <= flag_mask;
            end
        end
    end
    
    always @ (posedge clk) begin
        if(reset) begin
            counter <= 0;
        end
        else begin
            if(flag_mask)begin
                counter <= counter + 1;
            end
            else begin
                counter <= 0;
            end
        end
    end
    
    assign signal_out = (flag_mask) ? s_in : 0;
    
endmodule
