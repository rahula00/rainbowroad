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


module ring_counter(
    input clk, digsel, R,
    output [3:0] Q
    );
    
    wire q1, q2, q3, q4;
    wire d1, d2, d3, d4;
    
    FDRE #(.INIT(1'b1) ) ff1 (.C(clk), .R(R), .CE(digsel), .D(q4), .Q(q1));
    assign Q[3] = q4;
    FDRE #(.INIT(1'b0) ) ff2 (.C(clk), .R(R), .CE(digsel), .D(q1), .Q(q2));
    assign Q[2] = q3;
    FDRE #(.INIT(1'b0) ) ff3 (.C(clk), .R(R), .CE(digsel), .D(q2), .Q(q3));
    assign Q[1] = q2;
    FDRE #(.INIT(1'b0) ) ff4 (.C(clk), .R(R), .CE(digsel), .D(q3), .Q(q4));
    assign Q[0] = q1;
    
    

endmodule
