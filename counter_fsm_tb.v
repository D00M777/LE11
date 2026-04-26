`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:20 PM
// Design Name: 
// Module Name: le9_tb
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

module test;
  reg en,clk,reset;
  wire pulse;
    
  // Instantiate design under test
  state_cntr U1(
  .en(en), .clk(clk), .reset(reset), .pulse(pulse)
  );
    initial begin
    en = 0;
    clk = 0;
    reset = 0;
    #2
    reset = 1;
    #2 
    reset = 0;
    #6
    en = 1;
    #800
    $finish;
    //$display("Value of c in hex is %h", c);
    //$display("Parity of c is %b", parity);
  end
  
  always begin
    #10
    clk = ~clk;
  end
  
endmodule