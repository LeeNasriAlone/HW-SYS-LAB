`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2020 12:54:40 PM
// Design Name: 
// Module Name: clockdiv
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


module clockDiv(
    output clkDiv,
    input clk
    );

    reg clkDiv;
    
initial begin
    clkDiv=0;
end;
always @(posedge clk)
begin
    clkDiv=~clkDiv;
end
endmodule
