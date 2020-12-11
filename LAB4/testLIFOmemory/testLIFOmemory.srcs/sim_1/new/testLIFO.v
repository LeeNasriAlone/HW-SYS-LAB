`timescale 1ns / 1ns

module LIFObuffer_tb;

 // Inputs

 reg [7:0] dataIn;

 reg RW;

 reg EN;

 reg Rst;

 reg Clk;

 // Outputs

 wire [7:0] dataOut;

 wire EMPTY;

 wire FULL;
 wire [7:0] top;
 wire [2:0] SP;

 // Instantiate the Unit Under Test (UUT)

 LIFObuffer uut (dataIn, dataOut, RW,EN, Rst, EMPTY, FULL, Clk,top,SP);
 initial begin
  // Initialize Inputs

  dataIn  = 8'h00;
  RW  = 1'b0;
  EN  = 1'b0;
  Rst  = 1'b1;
  Clk  = 1'b0;
  // Wait 100 ns for global reset to finish

  #100;      
  // Add stimulus here
  EN   = 1'b1;
  Rst  = 1'b1;

  #40;
  Rst     = 1'b0;
  RW      = 1'b0;
  dataIn  = 8'h00;

  #20;
  dataIn = 8'h02;

  #20;
  dataIn = 8'h04;

  #20;
  dataIn = 8'h06;

  #20;
  RW  = 1'b1;
  dataIn = 8'h06;
  
  #20
  dataIn = 8'h0F;
  
  #20
  dataIn = 8'h5F;
  
  #20
  dataIn = 8'hFF;

 end 

   always #10 Clk = ~Clk;

endmodule