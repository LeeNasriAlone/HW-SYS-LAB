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
    input btnU,
    input btnL,
    input btnD,
    input btnR
    );

wire targetClk;
wire [25:0] tclk;
wire [7:0] num0,num1,num2,num3;
wire an0,an1,an2,an3;
wire [7:0] sw2, SW;

assign an = {an0,an1,an2,an3};

genvar i;
generate for(i = 0; i < 8; i = i + 1)
begin
    singlePulser sp(sw2[i], sw[i], targetClk);
    singlePulser sp2(SW[i], sw2[i], tclk[0]);
end
endgenerate

assign tclk[0] = clk;
genvar c;
generate for(c = 0; c < 25; c = c + 1)
begin
    clockDiv div(tclk[c + 1], tclk[c]);
end
endgenerate

clockDiv divTarget(targetClk, tclk[18]);
wire EMPTY, FULL;
wire BTNU, BTNL, BTND, BTNR;
singlePulser btnu(BTNU, btnU, clk);
singlePulser btnl(BTNL, btnL, clk);
singlePulser btnd(BTND, btnD, clk);
singlePulser btnr(BTNR, btnR, clk);
wire [3:0] huns;
wire [3:0] tens;
wire[3:0] ones;
reg [7:0] result;
wire [7:0] result2;
always @(posedge clk) begin
    result = result2;
end
calculator cal(sw[3:0], sw[7:4], BTNU, BTNL, BTND, BTNR, clk, result2);
BCD bcd(huns, tens, ones, result, clk);
assign num3 = 4'b0000;
assign num2 = {huns};
assign num1 = {tens};
assign num0 = {ones};

quadSevenSeg QuadSevenSeg(seg,dp,an[0],an[1],an[2],an[3],num0,num1,num2,num3,targetClk);

endmodule
