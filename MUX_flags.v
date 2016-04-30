`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:13 04/19/2016 
// Design Name: 
// Module Name:    MUX_flags 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MUX_flags(
    input wire sel,
    input wire [3:0] flag_a,
    input wire [3:0] flag_b,
    output reg [3:0] flag_out
    );

always @*
begin
	case (sel)
			1'b0: flag_out = flag_a;
			1'b1: flag_out = flag_b;
		endcase
end

endmodule
