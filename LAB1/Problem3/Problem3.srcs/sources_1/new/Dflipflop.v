`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 09:48:35 PM
// Design Name: 
// Module Name: Dflipflop
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


module Dflipflop(q,
    clock,
    nreset,
    d
    );
    
input clock;
input nreset; 
input d;
output q;

reg q;

always @(posedge clock or nreset)
begin
    if (nreset == 1'b1)
        q=d;
    else
        q=1'b0;
end
endmodule
