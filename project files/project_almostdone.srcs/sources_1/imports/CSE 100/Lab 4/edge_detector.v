`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2020 12:03:46 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
    input btn, clk,
    output clkout
    );
    
    wire w1;
    FDRE #(.INIT(1'b0) ) ff1 (.C(clk), .R(), .CE(1'b1), .D(btn), .Q(w1));
    assign clkout = (btn & ~w1);
endmodule
