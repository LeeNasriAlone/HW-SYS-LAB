`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 11:32:51 AM
// Design Name: 
// Module Name: bRam
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


module SinglePortRAM (
    inout wire [7:0] d, // Data In and Out
    input wire [6:0] addr , // Address
    input wire oe , // Output Enable
    input wire clk , we) ;
    //parameter RAM WIDTH = [6:0] addr;
    //parameter RAM ADDR BITS = 5'b0;
    //reg [RAMWIDTH-1:0] <ram name> [(2??RAMADDRBITS)- 1:0]; reg [RAM WIDTH-1:0] <outputdata >;
    //<reg or wire> [RAMADDRBITS-1:0] <address>;<reg or wire> [RAMWIDTH-1:0] <input data >; always @(posedge <clock>)if (<ram enable>) beginif (<write enable>) begin<ram name>[<address >] <= <input data >; <output data> <= <input data >;end else<output data> <= <ram name>[<address >]; end
    reg [7:0] mem [127:0];
    always @(posedge clk)
        if(we)
            mem[addr] <= d;
    assign d = oe ? mem[addr] : 8'bZ;
    endmodule
