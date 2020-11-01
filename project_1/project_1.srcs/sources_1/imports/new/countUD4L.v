`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2020 11:57:55 AM
// Design Name: 
// Module Name: countUD4L
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


module countUD4L(
    input clk, Up, Dw, LD,
    input [3:0] Din,
    input R,
    output [3:0] Q,
    output UTC, DTC
    );
    
    //CE = ((~Up & ~Dw) | LD)

    // Down
    // ~Q[0]
    // (Q[0] & Q[1]) | (~Q[0] & ~Q[1])
    // (Q[2] & (Q[1] | Q[0])) | (~Q[2] & ~Q[1] & ~Q[0])
    // (Q[3] & (Q[2] | Q[1] | Q[0])) | (~Q[3] & ~Q[2] & ~Q[1] & ~Q[0])
    
    // Up
    // ~Q[0]
    // Q[1] ^ Q[0]
    // Q[2] ^ (Q[1] & Q[0])
    // Q[3] ^ (Q[2] & Q[1] & Q[0])

    
    wire [3:0] D;
    
    assign D[0] = (Up & ~Dw & ~LD & ~Q[0]) | (~Up & Dw & ~LD & ~Q[0]) | (LD & Din[0]);
    assign D[1] = ( Up & ~Dw & ~LD & ( Q[1] ^ Q[0] ) ) | (~Up & Dw & ~LD & (( Q[0] & Q[1] ) | ( ~Q[0] & ~Q[1] )) ) | (LD & Din[1]);
    assign D[2] = ( Up & ~Dw & ~LD & (Q[2] ^ (Q[1] & Q[0])) ) | (~Up & Dw & ~LD & ((Q[2] & (Q[1] | Q[0])) | (~Q[2] & ~Q[1] & ~Q[0]))) | (LD & Din[2]);
    assign D[3] = (Up & ~Dw & ~LD & (Q[3] ^ (Q[2] & Q[1] & Q[0])) ) | (~Up & Dw & ~LD & ((Q[3] & (Q[2] | Q[1] | Q[0])) | (~Q[3] & ~Q[2] & ~Q[1] & ~Q[0]))) | (LD & Din[3]);
    
    FDRE #(.INIT(1'b0)) FF_1 (.C(clk), .R(R), .CE( (~LD & (Up ^ Dw)) | LD), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) FF_2 (.C(clk), .R(R), .CE( (~LD & (Up ^ Dw)) | LD), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) FF_3 (.C(clk), .R(R), .CE( (~LD & (Up ^ Dw)) | LD), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) FF_4 (.C(clk), .R(R), .CE( (~LD & (Up ^ Dw)) | LD), .D(D[3]), .Q(Q[3]));
    
    assign UTC = (Q[3] & Q[2] & Q[1] & Q[0]);
    assign DTC = (~Q[3] & ~Q[2] & ~Q[1] & ~Q[0]);
    
endmodule
