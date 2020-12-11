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
                       output [7:0] dataOut,
                       input RW,
                       input EN,
                       input Rst,
                       output EMPTY,
                       output FULL,
                       input Clk,
                       output [7:0] top,
                       output [2:0] SP
                      );

    reg EMPTY,FULL;
    reg [7:0] dataOut;
    reg [3:0] stack_mem[7:0];
    reg  [2:0] SP;
    wire [7:0] top;   
    
    integer i;
    always @ (posedge Clk)

    begin
     if (EN==0);
     else begin
        if (Rst==1) begin
          SP       = 3'd4;
          EMPTY    = SP[2];
          dataOut  = 8'h0;
          for (i=0;i<4;i=i+1) begin
            stack_mem[i]= 0;
          end
         end
      else if (Rst==0) begin
        FULL = SP? 0:1;
        EMPTY  = SP[2];
        dataOut = 8'hx;
        if (FULL == 1'b0 && RW == 1'b0) begin
           SP            = SP-1'b1;
           FULL          = SP? 0:1;
           EMPTY         = SP[2];
           stack_mem[SP] = dataIn;
         end
       else if (EMPTY == 1'b0 && RW == 1'b1) begin
           dataOut  = stack_mem[SP];
           stack_mem[SP] = 0;
           SP  = SP+1;
           FULL  = SP? 0:1;
           EMPTY  = SP[2];
        end
       else;
      end
      else;
     end
    end
    assign top = stack_mem[SP];
    endmodule





