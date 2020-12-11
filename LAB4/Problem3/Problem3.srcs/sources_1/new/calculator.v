`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 12:38:56 PM
// Design Name: 
// Module Name: calculator
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


module calculator(
    input [3:0] A,
    input [3:0] B,
    input add,
    input subtract,
    input mul,
    input div,
    input clk,
    output [7:0] result
    );
reg [7:0] result;
always @(posedge clk)
    begin
    if (add == 1)
        result = A + B;
    else if (subtract == 1)
        result = A - B;
    else if (mul == 1)
        result = A * B;
    else if (div == 1)
        if (B == 0)
            result = 0;
        else
            result = A / B;
    end
endmodule
