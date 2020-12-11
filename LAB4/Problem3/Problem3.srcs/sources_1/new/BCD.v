`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2020 08:38:00 PM
// Design Name: 
// Module Name: BCD
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


module BCD(
    output reg [3:0] huns,
    output reg [3:0] tens,
    output reg [3:0] ones,
    input [7:0] binary,
    input clk
    );

    integer i;
    always @(posedge clk)
    begin
        huns = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
        for(i = 7; i >= 0; i = i - 1) begin
            if (huns >= 5)
                huns = huns + 3;
            if (tens >= 5)
                tens = tens + 3;
            if (ones >= 5)
                ones = ones + 3;

            huns = huns << 1;
            huns[0] = tens[3];
            tens = tens << 1;
            tens[0] = ones[3];
            ones = ones << 1;
            ones[0] = binary[i];
        end
    end
endmodule
