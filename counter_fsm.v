`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:37 PM
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


module state_cntr (
    input clk,
    input reset,
    input en,
    input  [7:0] tc,
    output reg [7:0] cnt,
    output pulse
);
wire ones_en = en && !(tens_cnt == 5 && ones_cnt == 4);

// flip-flops (state memeory)

always @(posedge clk or posedge reset) begin
    if (reset)
        cnt <= 8'd0;
    else if (en) begin
        if (cnt == tc)
            cnt <= 8'd0;
        else
            cnt <= cnt + 1'b1;
    end
end

assign pulse = en && (cnt == tc);

endmodule
