`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2020 01:35:28 AM
// Design Name: 
// Module Name: crash_check
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


module crash_check(
    input [23:0]seg, 
    input[11:0] hCount, vCount, width, 
    output check
    );
    wire [11:0] xRef, yRef;
    wire [11:0] halfWidth = width/2;
    assign xRef = seg[23:12];
    assign yRef = seg[11:0];
    wire yLow, xLow, yHigh, xHigh;
    assign yLow = (10'd400 > (yRef-10'd16));
    assign yHigh = (10'd400 < (yRef+10'd80));
    assign xLow = (10'd320 > (xRef-(10'd8 + halfWidth)));
    assign xHigh = (10'd320 < (xRef + 10'd8 + halfWidth));
    
    assign check = yLow & yHigh & xLow & xHigh;
endmodule
