`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 11:09:11 AM
// Design Name: 
// Module Name: system
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


module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk,
    input [7:0] sw,
    input btnC,
    input btnU
    );

wire targetClk;
wire [25:0] tclk;
wire [3:0] num0,num1,num2,num3;
wire an0,an1,an2,an3;
assign an = {an0,an1,an2,an3};

genvar i;
assign tclk[0] = clk;
genvar c;
generate for(c = 0; c < 25; c = c + 1)
begin
    clockDiv div(tclk[c + 1], tclk[c]);
end
endgenerate

wire [3:0] huns;
wire [3:0] tens;
wire [3:0] ones;
clockDiv divTarget(targetClk, tclk[18]);
BCD bcd(huns, tens, ones, sw, clk);
assign num0 = 4'b0000;
assign num1 = {huns};
assign num2 = {tens};
assign num3 = {ones};
quadSevenSeg QuadSevenSeg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);

endmodule
