`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2020 06:20:21 PM
// Design Name: 
// Module Name: FIFOmemory
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


    module LIFObuffer( input [7:0] dataIn,
                       output [7:0] dataout,
                       input Read,
                       input Write,
                       input reset,
                       output EMPTY,
                       output FULL,
                       input Clk,
                       output [7:0] SP
                      );

    reg EMPTY, FULL;
    reg [7:0] dataout;
    reg [3:0] stack_mem[7:0];
    reg [7:0] SP;
    integer i;
    
    always @ (posedge Clk)
    begin
    if (reset == 1)
    begin
          SP       = 3'd4;
          EMPTY    = SP[2];
          dataout = 0;
          for (i=0;i<=4;i=i+1) begin
            stack_mem[i]= 0;
          end
    end
    else if (reset == 0)
    begin
        FULL = SP? 0:1;
        EMPTY  = SP[2];
        //dataOut = 8'hx;
        if (FULL == 1'b0 && Write == 1'b1) begin
           SP            = SP-1'b1;
           FULL          = SP? 0:1;
           EMPTY         = SP[2];
           stack_mem[SP] = dataIn;
         end
       else if (EMPTY == 1'b0 && Read == 1'b1) begin
           dataout  = stack_mem[SP];
           stack_mem[SP] = 0;
           SP  = SP+1;
           FULL  = SP? 0:1;
           EMPTY  = SP[2];
        end
        end
    end
 endmodule





