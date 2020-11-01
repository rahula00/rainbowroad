`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 05:46:40 PM
// Design Name: 
// Module Name: counterUD8L (reused from 16 bit counter from Lab 4)
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

module counterUD12L(
    input clk, Up, Dw, R, LD,
    input [11:0] Din,
    output [11:0] Q,
    output UTC, DTC
    );
    
    assign UTC = (Q[7] & Q[6] & Q[5] & Q[4] & Q[3] & Q[2] & Q[1] & Q[0]);
    assign DTC = (~Q[7] & ~Q[6] & ~Q[5] & ~Q[4] & ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0]);
    wire u1, u2, d1, d2;
    
    countUD4L ct_1(.clk(clk), .Up(Up), .Dw(Dw), .LD(LD), .Din(Din[3:0]), .Q(Q[3:0]), .UTC(u1), .DTC(d1), .R(R));
    countUD4L ct_2(.clk(clk), .Up(u1 & Up), .Dw(Dw & d1), .LD(LD), .Din(Din[7:4]), .Q(Q[7:4]), .UTC(u2), .DTC(d2), .R(R));
    countUD4L ct_3(.clk(clk), .Up(u1 & u2 & Up), .Dw(Dw & d1 & d2), .LD(LD), .Din(Din[11:8]), .Q(Q[11:8]), .UTC(), .DTC(), .R(R));
    
endmodule
