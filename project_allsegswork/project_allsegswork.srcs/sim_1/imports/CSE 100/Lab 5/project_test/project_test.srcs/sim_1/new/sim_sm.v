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


module simTop();
    reg clkin, btnC, btnR, btnL;
    reg[15:0] sw;
    reg start;
    reg crash;
    wire [15:0] led;
    wire Hsync;
    wire Vsync;
    wire [3:0] vgaRed, vgaGreen, vgaBlue;
    wire [6:0] seg;
    wire dp;
    wire [3:0] an;
    top_level UUT(.clkin(clkin), .crash(crash), .btnC(btnC), .btnR(btnR), .btnL(btnL), .sw(sw), .led(led), .Hsync(Hsync), .Vsync(Vsync), .vgaRed(vgaRed), .vgaGreen(vgaGreen), .vgaBlue(vgaBlue), .seg(seg), .dp(dp), .an(an));
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
     sw[6:4] = 3'b111;
     assign btnC = 1'b0;
     assign btnR = 1'b0;
     assign btnL = 1'b0;
     assign crash = 1'b0;
    
     sw[2:0] = 3'b010;
     #1000;
      assign btnC = 1'b1;
    
     //assign LD = 0;
     //assign decL = 1'b1;
     #1000;
      assign btnC = 1'b0;
     
     #3000;
    assign crash = 1'b1;
    #8000;
      assign btnC = 1'b1;
    

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

