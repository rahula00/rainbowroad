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
module car(
    output[11:0] carMinX, carMaxX, carMinY, carMaxY
    //output[11:0] carX, carY
    );
    
    //wire [11:0] carMinX, carMaxX, carMinY, carMaxY;
    wire [11:0] carX, carY;
    assign carX = 10'd320;
    assign carY = 10'd400;
    assign carMinX = carX - 10'd8;
    assign carMaxX = carX + 10'd8;
    assign carMinY = carY;
    assign carMaxY = carY + 10'd16;
endmodule
