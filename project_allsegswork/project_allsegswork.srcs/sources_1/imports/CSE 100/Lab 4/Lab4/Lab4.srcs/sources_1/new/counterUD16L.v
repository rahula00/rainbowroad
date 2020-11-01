`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 05:46:40 PM
// Design Name: 
// Module Name: counterUD16L
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


module counterUD16L(
    input clk, Up, Dw, LD, R,
    input [15:0] Din,
    output [15:0] Q,
    output UTC, DTC
    );
    
    assign UTC = (Q[15] & Q[14] & Q[13] & Q[12] & Q[11] & Q[10] & Q[9] & Q[8] & Q[7] & Q[6] & Q[5] & Q[4] & Q[3] & Q[2] & Q[1] & Q[0]);
    assign DTC = (~Q[15] & ~Q[14] & ~Q[13] & ~Q[12] & ~Q[11] & ~Q[10] & ~Q[9] & ~Q[8] & ~Q[7] & ~Q[6] & ~Q[5] & ~Q[4] & ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0]);
    wire u1, u2, u3, d1, d2, d3;
    
    countUD4L ct_1(.clk(clk), .R(R), .Up(Up), .Dw(Dw), .LD(LD), .Din(Din[3:0]), .Q(Q[3:0]), .UTC(u1), .DTC(d1));
    countUD4L ct_2(.clk(clk), .R(R), .Up(u1 & Up), .Dw(Dw & d1), .LD(LD), .Din(Din[7:4]), .Q(Q[7:4]), .UTC(u2), .DTC(d2));
    countUD4L ct_3(.clk(clk), .R(R), .Up(u1 & u2 & Up), .Dw(Dw & d1 & d2), .LD(LD), .Din(Din[11:8]), .Q(Q[11:8]), .UTC(u3), .DTC(d3));
    countUD4L ct_4(.clk(clk), .R(R), .Up(u1 & u2 & u3 & Up), .Dw(Dw & d1 & d2 & d3), .LD(LD), .Din(Din[15:12]), .Q(Q[15:12]), .UTC(), .DTC());
    
endmodule
