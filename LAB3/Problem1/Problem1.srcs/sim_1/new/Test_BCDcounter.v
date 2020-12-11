`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 09:22:48 PM
// Design Name: 
// Module Name: Test_BCDcounter
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


module Test_BCDcounter();
reg clock, set0, set9, up, down;
wire [3:0] bcd_output;

BCDcounter count(set0, set9, clock, up, down, bcd_output, cout, borrow);
always
    #10 clock =~ clock;
initial begin
    #0;
    up = 0;
    down = 0;
    set9 = 0;
    set0 = 0;
    clock = 0;
    #26
    up = 1;
    #26;
    up=0;
    down=1;
    #66
    down = 0;
    set0 = 0;
    #26
    set0 = 0;
    set9 = 1;
    #26
    set9=0;
    up=1;
    #200
    $finish;
end
endmodule 
