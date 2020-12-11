`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 06:25:11 PM
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
    reg a;
    reg b;
    reg cin;
    
 // output
    wire s;
    wire cout;
    
    reg [2:0] i;
    
 fullAdder uut(
    .a(a) ,
    .b(b) ,
    .cin(cin) ,
    .s(s),
    .cout(cout)
    );

initial begin

    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    
    #1;
    
    for  (i = 3'd0; i<8; i=1+1'b1)
    begin
        {a, b, cin} = {a, b, cin} + 1'b1;
        #1;
    end
 end
endmodule
