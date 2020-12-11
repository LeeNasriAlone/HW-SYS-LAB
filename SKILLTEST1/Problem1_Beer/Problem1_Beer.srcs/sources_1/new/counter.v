`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2020 01:05:15 PM
// Design Name: 
// Module Name: counter
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


module counter(
    output Z,
    output I,
    output H,
    output G,
    output F,
    output E,
    output D,
    output C,
    output B,
    output A,
    input clock
    );
    
    reg [8:0] hex;
    reg round;
    
    assign {I,H,G,F,E,D,C,B,A} = hex;
    assign Z = round;
    
    initial
    begin
        hex = 9'b000000000;
        round = 0;
    end
    
    always @(posedge clock)
    begin
        case(hex)
            9'b000000000: hex = 9'b000000001;
            9'b000000001: hex = 9'b000000011;
            9'b000000011: hex = 9'b000000111;
            9'b000000111: hex = 9'b000001111;
            9'b000001111: hex = 9'b000011111;
            9'b000011111: hex = 9'b000111111;
            9'b000111111: hex = 9'b001111111;
            9'b001111111: hex = 9'b011111111;
            9'b011111111: hex = 9'b111111111;
            9'b111111111: hex = 9'b000000000;
        endcase
    end
endmodule
