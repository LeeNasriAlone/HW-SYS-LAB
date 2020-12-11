`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2020 11:29:33 AM
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
    input [7:0] sw,
    input btnU,
    input btnC,
    input clk
    );
wire [3:0] num0 ;
wire [3:0] num1 ;
wire [3:0] num2 ;
wire [3:0] num3 ;
assign num0 = 0;
assign num1 = 0;
assign num2 = 0;
assign num3 = 0;


wire targetClk;
wire an0, an1, an2, an3;
assign an = {an3, an2, an1, an0};
wire [18:0] tclk;

assign tclk[0] = clk;
genvar c;
generate for(c=0; c<18; c=c+1)
begin
    clockDiv fdiv(tclk[c+1],tclk[c]);
end
endgenerate
clockDiv fdivTarget(targetClk,tclk[18]);

// -------------------------------------------- Modify

wire up0, up1, up2, up3, down0, down1, down2, down3;
wire cout0, cout1, cout2, cout3;
wire bout0, bout1, bout2, bout3;

singlePulser SW0(sw0, sw[0], clk);
singlePulser SW1(sw1, sw[1], clk);
singlePulser SW2(sw2, sw[2], clk);
singlePulser SW3(sw3, sw[3], clk);
singlePulser SW4(sw4, sw[4], clk);
singlePulser SW5(sw5, sw[5], clk);
singlePulser SW6(sw6, sw[6], clk);
singlePulser SW7(sw7, sw[7], clk);

assign up0 = sw1;
assign up1 = cout0 || sw3;
assign up2 = cout1 || sw5;
assign up3 = cout2 || sw7;
assign down0 = sw0;
assign down1 = bout0 || sw2;
assign down2 = bout1 || sw4;
assign down3 = bout2 || sw6;

BCDcounter BCD0(btnC, btnU, clk, up0, down0, num0, cout0, bout0 );
BCDcounter BCD1(btnC, btnU, clk, up1, down1, num1, cout1, bout1 );
BCDcounter BCD2(btnC, btnU, clk, up2, down2, num2, cout2, bout2 );
BCDcounter BCD3(btnC, btnU, clk, up3, down3, num3, cout3, bout3 );

quadSevenSeg q7seg(seg, dp, an[0], an[1], an[2], an[3], num0, num1, num2, num3, targetClk);
endmodule
