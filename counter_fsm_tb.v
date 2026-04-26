`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:20 PM
// Design Name: 
// Module Name: 
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

module state_cntr_tb;

reg clk, reset, en;
wire ones_pulse;
wire [7:0] ones_cnt;
wire [7:0] tens_cnt;

initial clk = 0;
always begin
    #5 //wait
    clk = ~clk; //clock set up
end
// Ones place counter
  state_cntr ones (.clk(clk), .reset(reset), .en(ones_en), .tc(8'd9), .count(ones_cnt), .pulse(ones_pulse));

// Tens place counter (0-3)
state_cntr tens (.clk(clk), .reset(reset), .en(ones_pulse), .tc(8'd3), .count(tens_cnt), .pulse());

initial begin
    reset = 1; //reset
    en = 0; //enable off
    #20; //wait

    reset = 0; //reset off
    en = 1; // enable on

    #500; //wait
    $finish; //end
end

endmodule
