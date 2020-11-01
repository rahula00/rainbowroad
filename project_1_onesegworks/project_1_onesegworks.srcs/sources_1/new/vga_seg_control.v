`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2020 12:16:55 PM
// Design Name: 
// Module Name: vga_seg_control
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


module vga_seg_control(
    input [23:0]seg, 
    input[11:0] hCount, vCount, width, 
    output segXrange, segYrange
    );
    wire [11:0]segXmin, segYmin, segXmax, segYmax;
    wire [11:0] halfWidth = width/2;
    assign segXmin = seg[23:12] - halfWidth;
    assign segYmin = (segYmax > 10'd80) ? (seg[11:0] - 10'd80) : 10'b0;
    assign segXmax = seg[23:12] + halfWidth;
    assign segYmax = seg[11:0];
    assign segXrange = (hCount >= segXmin) & (hCount <= segXmax);
    assign segYrange = (vCount >= segYmin) & (vCount <= segYmax);
    
endmodule
