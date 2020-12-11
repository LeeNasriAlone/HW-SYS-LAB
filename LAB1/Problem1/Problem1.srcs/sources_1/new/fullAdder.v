`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 06:19:20 PM
// Design Name: 
// Module Name: fullAdder
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


module fullAdder(
    cout,
    s,
    a,
    b,
    cin
    );
    
input a, b, cin;
output s, cout;

assign s = (a ^ b) ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
