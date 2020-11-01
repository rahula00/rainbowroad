`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 12:58:55 PM
// Design Name: 
// Module Name: roadSegs
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

//The reference point is the center of the bottom part of the segment!
module roadSegs(
    input clk, decL, incR, LD, R,
    input [11:0] referencePointX, referencePointY,
    input frameSignal,
    input[11:0] width,
    //input[3:0] Din,
    //input CE, LD, R,
    output[11:0] posX, posY
    );
    wire [11:0]halfWidth;
   // wire height;
   // wire topLeft, topRight, bottomLeft, bottomRight;
    
    wire minX, maxX, maxY, cappedX;
    wire [11:0]relMinX, relMaxX;
    
    wire[3:0] test;

    
    assign halfWidth = width/2;
    
    assign relMinX = 10'd0 + halfWidth;
    assign relMaxX = 10'd639 - halfWidth;
    assign minX = (posX == relMinX);
    assign maxX = (posX == relMaxX);
    assign maxY = (posY == 10'd559);
    assign cappedX = minX | maxX;
    // assign input D = (posX == 10'd0) ? x : posX
    // (referencePointX & ~cappedX) | (11{minX} & relMinX) | (11{maxX} & relMaxX)
    
    wire[11:0] minOrMaxX, inputDX;
    assign minOrMaxX = minX ? relMinX : relMaxX;
    assign inputDX = cappedX ? minOrMaxX : referencePointX;
    counterUD12L x(.clk(clk), .Dw(decL), .Up(incR), .R(R), .Din(inputDX), .Q(posX), .LD(LD | cappedX));
    wire[11:0] inputDY, resetY;
    assign resetY = 10'd0;
    assign inputDY = maxY ? resetY : referencePointY;
    counterUD12L y(.clk(clk), .Dw(1'b0), .Up(frameSignal), .R(R), .Din(inputDY), .Q(posY), .LD(LD | maxY));
    
    
    

endmodule
