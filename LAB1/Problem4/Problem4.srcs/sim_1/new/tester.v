`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 11:02:16 PM
// Design Name: 
// Module Name: tester
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


module tester;
reg clock;
reg d;
wire q0, q1;
wire q2, q3;

shiftA a1({q1,q0},clock, d);
shiftB b1({q3, q2}, clock, d);

always
    #10 clock =~ clock;
    
initial begin
    #0 d=0;
    clock = 0;
    #10 d = 1;
    #20 d = 1;
    #30 d = 0;
    #40 d = 1;
    
    #1000 $finish;
end
endmodule
