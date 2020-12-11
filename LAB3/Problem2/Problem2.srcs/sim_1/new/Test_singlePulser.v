`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 11:00:25 PM
// Design Name: 
// Module Name: Test_singlePulser
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


module Test_singlePulser();
    reg d, clk;
    wire sq;
singlePulser single(sq, d, clk);
initial begin
    clk = 0;
    d = 0;                                                                                                                                              
    forever #5   clk=~clk; 
end

initial begin
    d = 0;
    #10
    d = 1;
    #10
    d = 0;
    #10
    d = 1;
    #50;
    d = 0;
    #10
    d=1;
    #10
    d=0;
    d=1;
    #10
    d=0;
    $finish;
end

endmodule
