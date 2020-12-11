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
wire [7:0] sw2, SW;

wire [7:0] d, d2;

genvar i;
generate for(i = 0; i < 8; i = i + 1)
begin
    singlePulser sp(sw2[i], sw[i], targetClk);
    singlePulser sp2(SW[i], sw2[i], tclk[0]);
end
endgenerate

wire set9, set0;
wire [2:0] up, down;
wire [3:0] cout, bout;

assign set9 = btnU || cout[3];
assign set0 = btnC || bout[3];
assign up[0] = cout[0] || SW[3];
assign up[1] = cout[1] || SW[5];
assign up[2] = cout[2] || SW[7];
assign down[0] = bout[0] || SW[2];
assign down[1] = bout[1] || SW[4];
assign down[2] = bout[2] || SW[6];

BCDcounter BCD3(num3[3],num3[2],num3[1],num3[0],cout[0],bout[0],SW[1],SW[0],set9,set0,tclk[0]);
BCDcounter BCD2(num2[3],num2[2],num2[1],num2[0],cout[1],bout[1],up[0],down[0],set9,set0,tclk[0]);
BCDcounter BCD1(num1[3],num1[2],num1[1],num1[0],cout[2],bout[2],up[1],down[1],set9,set0,tclk[0]);
BCDcounter BCD0(num0[3],num0[2],num0[1],num0[0],cout[3],bout[3],up[2],down[2],set9,set0,tclk[0]);
    
wire [3:0] num0,num1,num2,num3;

wire an0,an1,an2,an3;

assign an = {an0,an1,an2,an3};

assign tclk[0] = clk;

genvar c;
generate for(c = 0; c < 25; c = c + 1)
begin
    clockDiv div(tclk[c + 1], tclk[c]);
end
endgenerate

clockDiv divTarget(targetClk, tclk[18]);

quadSevenSeg QuadSevenSeg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);

endmodule
