`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 03:46:01 PM
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
    output [9:0] led,
    input clk
    );

wire targetClk;
wire [25:0] tclk;

assign tclk[0] = clk;

genvar c;
generate for(c = 0; c < 25; c = c + 1)
begin
    clockDiv div(tclk[c + 1], tclk[c]);
end
endgenerate

clockDiv divTarget(targetClk, tclk[25]);

wire num0, num1, num2, num3, num4, num5, num6, num7, num8, num9;

assign led = {num9,num8,num7,num6,num5,num4,num3,num2,num1,num0};
//assign ledA = a;

counter Counter(num9,num8,num7,num6,num5,num4,num3,num2,num1,num0,targetClk);

endmodule
