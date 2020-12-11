`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2020 01:10:17 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clock,
    output [3:0] coun
    );
       
reg [3:0] count;
initial begin
    count = 4'b0000;
end

always @(posedge clock)
begin
      case (countr)
          4'b0011 : count = 4'b0100;   // 0
          4'b0100 : count = 4'b0101;   // 1
          4'b0101 : count = 4'b0110;   // 2
          4'b0110 : count = 4'b0111;   // 3
          4'b0111 : count = 4'b1000;   // 4
          4'b1000 : count = 4'b1001;   // 5
          4'b1001 : count = 4'b1010;   // 6
          4'b1010 : count = 4'b1011;   // 7
          4'b1011 : count = 4'b1100;   // 8
          4'b1100 : count = 4'b0011;   // 9
      endcase
end
endmodule
