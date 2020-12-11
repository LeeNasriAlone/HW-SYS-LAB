`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2020 12:48:05 PM
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
    input clk,
    output [3:0] led
    );
    
wire [25:0] tclk;
wire targetClk;
wire [3:0] led;
assign tclk[0] = clk;
genvar c;
generate for(c = 0; c < 25; c = c + 1)
begin
    clockDiv div(tclk[c + 1], tclk[c]);
end
endgenerate
clockDiv divTarget(targetClk, tclk[18]);

counter count(targetClk, led);
endmodule
