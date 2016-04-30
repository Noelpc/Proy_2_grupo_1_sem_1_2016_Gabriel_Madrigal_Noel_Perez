`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:40 04/14/2016 
// Design Name: 
// Module Name:    reg_mes 
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
module reg_mes( 
    binary_in   , //  4 bit binary input
	decoder_out , //  16-bit  out
	EN
);
input [3:0] binary_in;
input EN;
output reg [7:0] decoder_out;

always@*
begin
	if(EN)
	begin
	case (binary_in) 
				4'b0000 : decoder_out = 8'h1;
				4'b0001 : decoder_out = 8'h2;
				4'b0010 : decoder_out = 8'h3;
				4'b0010 : decoder_out = 8'h4;
				4'b0011 : decoder_out = 8'h5;
				4'b0100 : decoder_out = 8'h6;
				4'b0101  : decoder_out = 8'h7;
				4'b0110  : decoder_out = 8'h9;
				4'b0111  : decoder_out = 8'h10;
				4'b1000  : decoder_out = 8'h11;
				4'b1001  : decoder_out = 8'h12;
		
		default decoder_out= 8'h0; 
		endcase
		 end
	else 
	decoder_out= 8'h0;
end

endmodule
