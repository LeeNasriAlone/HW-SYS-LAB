`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2020 05:21:36 PM
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
wire [18:0] tclk;

assign tclk[0] = clk;

genvar c;
generate for(c = 0; c < 18; c = c + 1)
begin
    clockDiv div(tclk[c + 1], tclk[c]);
end
endgenerate

clockDiv divTarget(targetClk, tclk[18]);
    
wire btnC2, btnC3, btnU2, btnU3;
reg [7:0] addr;
reg max;
    
singlePulser sp1(btnC2, btnC && (~(addr == 8'b0) || max), targetClk);
singlePulser sp2(btnU2, btnU && ~(max), targetClk);
singlePulser sp3(btnC3, btnC2, tclk[0]);
singlePulser sp4(btnU3, btnU2, tclk[0]);

wire [7:0] num, outNum;
reg [3:0] num0,num1;
wire [3:0] num2,num3;

assign num = {sw[7],sw[6],sw[5],sw[4],sw[3],sw[2],sw[1],sw[0]};

RAM ram(outNum, num, addr , btnC3, tclk[0], btnU3);

assign num2 = addr[7:4];
assign num3 = addr[3:0];

always @(posedge clk)
begin
    if (btnU3) begin
        addr = addr + 1;
        if (addr == 8'b0) begin
            max = 1;
        end
    end
    if (btnC3) begin
        addr <= addr - 1;
        num0 <= outNum[7:4];
        num1 <= outNum[3:0];
        max <= 0;
    end
end

initial
begin
    addr = 0;
    max = 0;
end

wire an0,an1,an2,an3;

assign an = {an0,an1,an2,an3};

quadSevenSeg QuadSevenSeg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);

endmodule
