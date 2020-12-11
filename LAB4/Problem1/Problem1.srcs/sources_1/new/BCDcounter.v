`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2020 10:45:47 PM
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
    output D,
    output C,
    output B,
    output A,
    output reg cout,
    output reg bout,
    input up,
    input down,
    input set9,
    input set0,
    input clock
    );
    
    reg [3:0] hex;
    
    assign {D,C,B,A} = hex;
    
    initial
    begin
        cout = 0;
        bout = 0;
        hex = 0;
    end
    
    always @(posedge clock)
    begin
        if (cout == 1)
            cout = 0;
        else if (bout == 1)
            bout = 0;
        if (set9 == 1)
        begin
            hex <= 4'b1001;
        end
        else if (set0 == 1)
        begin
            hex <= 4'b0000;
        end
        else if (up == 1)
        begin
            if (hex == 4'b1001)
            begin
                hex <= 4'b0000;
                cout <= 1;
            end
            else
                hex <= hex + 4'b0001;
        end
        else if (down == 1)
        begin
            if (hex == 4'b0000)
            begin
                hex <= 4'b1001;
                bout <= 1;
            end
            else
                hex <= hex - 4'b0001;
        end
    end
endmodule
