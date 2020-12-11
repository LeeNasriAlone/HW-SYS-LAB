`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 10:18:32 PM
// Design Name: 
// Module Name: singlePulser
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

/*
module dflipflop(
    output q,
    output nq,
    input clk,
    input nreset,
    input d
    );
    
    reg q;
    reg nq;
    
    always @(posedge clk)
    begin
        if(nreset ==1)
            begin
                q=d;
                nq=~d;
            end
        else
            begin
                q=0;
                nq=1;
            end
         end
endmodule*/

module singlePulser(
    output out,
    input in,
    input clk
    );
    wire out;
    reg r1, r2;

assign out = r1 & ~r2;
initial begin
    r1 = 0;
    r2 = 0;
end
    
    always @(posedge clk)
    begin
        r2 = r1;
        r1 = in;
    end

endmodule
