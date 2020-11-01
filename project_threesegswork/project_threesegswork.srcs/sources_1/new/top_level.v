`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 06:32:21 PM
// Design Name: 
// Module Name: top_level
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


module top_level(
    input clkin, btnU, btnR, btnL,
    input[15:0] sw,
    //input start,
    output [15:0] led,
    output Hsync,
    output Vsync,
    output [3:0] vgaRed, vgaGreen, vgaBlue,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
       
    
    wire clk, digsel;
    wire frame;
    wire active;
    wire [11:0]posX0, posY0, posY1, posX1, posY2, posX2, posY3, posX3, posY4, posX4, posY5, posX5, posY6, posX6, carMinX, carMaxX, carMinY, carMaxY;
    wire[11:0]width;
    assign width = 10'd8 + (sw[6:4] * 16);
    lab7_clks not_so_slow (.clkin(clkin), .greset(sw[0]), .clk(clk), .digsel(digsel));
    edge_detector ed(.btn(Vsync), .clk(clk), .clkout(frame));
    LFSR rndm(.clk(clk), .rnd());
    wire decL = btnL & frame;
    wire incR = btnR & frame;
    roadSegs seg0(.posX(posX0), .posY(posY0), .width(width), .clk(clk), .decL(decL), .incR(incR), .LD(btnU), .R(1'b0), .referencePointX(12'd310), .referencePointY(12'd480), .frameSignal(frame));
    roadSegs seg1(.posX(posX1), .posY(posY1), .width(width), .clk(clk), .decL(decL), .incR(incR), .LD(btnU), .R(1'b0), .referencePointX(12'd310), .referencePointY(12'd400), .frameSignal(frame));
    roadSegs seg2(.posX(posX2), .posY(posY2), .width(width), .clk(clk), .decL(decL), .incR(incR), .LD(btnU), .R(1'b0), .referencePointX(12'd310), .referencePointY(12'd320), .frameSignal(frame));
    roadSegs seg3(.posX(posX3), .posY(posY3), .width(width), .clk(clk), .decL(decL), .incR(incR), .LD(btnU), .R(1'b0), .referencePointX(12'd310), .referencePointY(12'd240), .frameSignal(frame));
    roadSegs seg4(.posX(posX4), .posY(posY4), .width(width), .clk(clk), .decL(decL), .incR(incR), .LD(btnU), .R(1'b0), .referencePointX(12'd310), .referencePointY(12'd160), .frameSignal(frame));
    roadSegs seg5(.posX(posX5), .posY(posY5), .width(width), .clk(clk), .decL(decL), .incR(incR), .LD(btnU), .R(1'b0), .referencePointX(12'd310), .referencePointY(12'd80), .frameSignal(frame));
    roadSegs seg6(.posX(posX6), .posY(posY6), .width(width), .clk(clk), .decL(decL), .incR(incR), .LD(btnU), .R(1'b0), .referencePointX(12'd310), .referencePointY(12'd0), .frameSignal(frame));
    car c(.carMinX(carMinX), .carMaxX(carMaxX), .carMinY(carMinY), .carMaxY(carMaxY));
    VGA_Display vga (.clk(clk), .hCount(), .vCount(), .hSync(Hsync), .vSync(Vsync), .active(active), .seg0({posX0, posY0}), .seg1({posX1, posY1}), .seg2({posX2, posY2}), .seg3({posX3, posY3}), .seg4({posX4, posY4}), .seg5({posX5, posY5}), .seg6({posX6, posY6}), .car({carMinX, carMaxX, carMinY, carMaxY}), .width(width), .vgaRed(vgaRed), .vgaGreen(vgaGreen), .vgaBlue(vgaBlue));

    //wire enable;
    //assign enable = ((hCount >= xLowEdge) & (hCount <= xHighEdge)) & (vCount >= yLowEdge
    //assign vgaRed = 3'b111;
    
    //input clk, decL, incR, LD, R,
    //input [11:0] referencePointX, referencePointY,
    //input [2:0] sw,
    //input frameSignal,
    //output[11:0] posX, posY
    
endmodule
