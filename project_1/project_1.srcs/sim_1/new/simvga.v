`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 12:02:14 PM
// Design Name: 
// Module Name: simReusable
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


module simReusable();
    reg clkin, decL, incR, LD, R;
    reg [11:0] referencePointX, referencePointY;
    reg frameSignal;
    reg [2:0] sw;
    //input[3:0] Din,
    //input CE, LD, R,
    wire [11:0] posX, posY;
 roadSegs rs(.clk(clkin), .R(R), .decL(decL), .frameSignal(frameSignal), .incR(incR), .LD(LD), .referencePointX(referencePointX), .referencePointY(referencePointY), .sw(sw), .posX(posX), .posY(posY));    
    
parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
            clkin = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
        end
	end
	
   initial
   begin
     assign referencePointX = 10'd479;
     assign referencePointY = 10'd240;
     assign LD = 1'b1;
     assign decL = 1'b0;
     assign incR = 1'b0;
     assign R = 1'b0;

     sw[2:0] = 3'b011;
     #1000;
     //assign LD = 0;
     //assign decL = 1'b1;
     #100;
     
     
     #100;
     assign LD = 1'b0;
     assign frameSignal = 1'b1;

	 // add your (input) stimuli here
	 // to set signal foo to value 0 use
	 // foo = 1'b0;
	 // to set signal foo to value 1 use
	 // foo = 1'b1;
	 //always advance time my multiples of 100ns
	 // to advance time by 100ns use the following line
	 #100;
	 
	 //assign decL = 1'b0;
   end
endmodule

