`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 06:09:20 PM
// Design Name: 
// Module Name: Selector
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


module Selector(
    input [3:0] sel,
    input [15:0] N,
    output [3:0] H
    );
    
    wire [3:0] w1, w2, w3, w4;
    assign w1 = N[15:12];
    assign w2 = N[11:8];
    assign w3 = N[7:4];
    assign w4 = N[3:0];
    
    assign H = ( (w1[3:0] & {4{sel[3]}}) | (w2[3:0] & {4{sel[2]}}) | (w3[3:0] & {4{sel[1]}}) | (w4[3:0] & {4{sel[0]}}) );

    
    
endmodule
