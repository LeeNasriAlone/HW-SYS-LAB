`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 10:56:30 PM
// Design Name: 
// Module Name: Shift
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


module shiftA(q1, clock, d);
output [1:0] q1;
input clock, d;
reg [1:0] q1;

always @(posedge clock)
begin
    q1[0] = d;
    q1[1] = q1[0];
end
endmodule

module shiftB(q2, clock, d);
output [1:0] q2;
input clock, d;

reg [1:0] q2;

always @(posedge clock)
begin
    q2[0] <= d;
    q2[1] <= q2[0];
end
endmodule
