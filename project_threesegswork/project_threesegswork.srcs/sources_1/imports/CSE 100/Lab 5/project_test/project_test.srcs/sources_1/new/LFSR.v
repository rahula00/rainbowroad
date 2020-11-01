`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 01:56:59 AM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input clk,
    output [7:0] rnd
    );
    wire [7:0]q;
    wire XOR = q[0]^q[5]^q[6]^q[7];
    FDRE #(.INIT(1'b1) ) ff_0 (.C(clk), .R(), .CE(1'b1), .D(XOR), .Q(q[0]));
    FDRE #(.INIT(1'b0) ) ff_1 (.C(clk), .R(), .CE(1'b1), .D(q[0]), .Q(q[1]));
    FDRE #(.INIT(1'b0) ) ff_2 (.C(clk), .R(), .CE(1'b1), .D(q[1]), .Q(q[2]));
    FDRE #(.INIT(1'b0) ) ff_3 (.C(clk), .R(), .CE(1'b1), .D(q[2]), .Q(q[3]));
    FDRE #(.INIT(1'b0) ) ff_4 (.C(clk), .R(), .CE(1'b1), .D(q[3]), .Q(q[4]));
    FDRE #(.INIT(1'b0) ) ff_5 (.C(clk), .R(), .CE(1'b1), .D(q[4]), .Q(q[5]));
    assign q[6] = 1'b0;
    assign q[7] = 1'b0;
    //FDRE #(.INIT(1'b0) ) ff_6 (.C(clk), .R(), .CE(1'b1), .D(q[5]), .Q(q[6]));
    //FDRE #(.INIT(1'b0) ) ff_7 (.C(clk), .R(), .CE(1'b1), .D(q[6]), .Q(q[7]));
    
    assign rnd = q;
endmodule
