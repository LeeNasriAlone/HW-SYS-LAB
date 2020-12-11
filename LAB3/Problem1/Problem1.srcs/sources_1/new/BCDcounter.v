`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 08:33:24 PM
// Design Name: 
// Module Name: BCDcounter
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


module BCDcounter(
    input set0,
    input set9,
    input clock,
    input up,
    input down,
    output [3:0] bcd_output,
    output cout,
    output borrow
    );
    
    reg [3:0] bcd_out;
    reg cout;
    reg borrow;

initial begin
    bcd_out = 4'b0000;
    cout = 0;
    borrow = 0;
end

always @(posedge clock)
begin
    cout = 0;
    borrow = 0;
    if (up)
        if (bcd_out == 4'b1001)
        begin
            bcd_out = 4'b0000;
            cout = 1;
        end
        else 
        begin
            bcd_out = bcd_out + 4'b0001;
        end
    else if (down)
        if (bcd_out == 4'b0000)
        begin
            bcd_out = 4'b1001;
            borrow = 1;
        end
        else
        begin
            bcd_out = bcd_out - 4'b0001;
        end
    if (set0)
        bcd_out = 4'b0000;
    else if (set9)
        bcd_out = 4'b1001;
end
assign bcd_output = bcd_out;
endmodule
