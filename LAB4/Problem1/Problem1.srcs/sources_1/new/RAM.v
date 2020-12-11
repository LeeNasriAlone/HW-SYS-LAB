`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2020 03:33:51 PM
// Design Name: 
// Module Name: RAM
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


module RAM(
    output [7:0] out,
    input [7:0] in,
    input [7:0] addr , // Address
    input oe , // Output Enable
    input clk , we
    );

reg [7:0] mem [255:0];
always @(posedge clk)
    if(we)
        mem[addr] <= in;
assign out = oe ? mem[addr-1] : 8'bZ;
endmodule

