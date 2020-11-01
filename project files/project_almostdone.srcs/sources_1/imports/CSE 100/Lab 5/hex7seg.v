`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2020 12:57:30 PM
// Design Name: 
// Module Name: hex7seg
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


module hex7seg(
    input [3:0] n,
    output [6:0] seg
    );
    
//one = 1'b1;
//zero = 1'b0;
m8_1 mult1 (.in({1'b0, n[0], n[0], 1'b0, 1'b0, ~n[0], 1'b0, n[0]}), .sel({n[3:1]}), .o(seg[0]));
m8_1 mult2 (.in({1'b1, ~n[0], n[0], 1'b0, ~n[0], n[0], 1'b0, 1'b0}), .sel({n[3:1]}), .o(seg[1]));
m8_1 mult3 (.in({1'b1, ~n[0], 1'b0, 1'b0, 1'b0, 1'b0, ~n[0], 1'b0}), .sel({n[3:1]}), .o(seg[2]));
m8_1 mult4 (.in({n[0], 1'b0, ~n[0], n[0], n[0], ~n[0], 1'b0, n[0]}), .sel({n[3:1]}), .o(seg[3]));
m8_1 mult5 (.in({1'b0, 1'b0, 1'b0, n[0], n[0], 1'b1, n[0], n[0]}), .sel({n[3:1]}), .o(seg[4]));
m8_1 mult6 (.in({1'b0, n[0], 1'b0, 1'b0, n[0], 1'b0, 1'b1, n[0]}), .sel({n[3:1]}), .o(seg[5]));
m8_1 mult7 (.in({1'b0, ~n[0], 1'b0, 1'b0, n[0], 1'b0, 1'b0, 1'b1}), .sel({n[3:1]}), .o(seg[6]));

endmodule
