`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 09:55:10 PM
// Design Name: 
// Module Name: Tester
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


module Tester;
// input
    reg clock;
    reg nreset;
    reg d;
// output
    wire q;
   
    
Dflipflop D1(
    .q(q),
    .clock(clock),
    .nreset(nreset),
    .d(d)
    );
always 
    #10 clock =~ clock;
    
initial begin
    #0 d = 0;
    clock = 0;
    nreset = 0;
 
    #50 nreset = 1;
    #1000 $finish;
end
always
    #8 d=~d;
endmodule
