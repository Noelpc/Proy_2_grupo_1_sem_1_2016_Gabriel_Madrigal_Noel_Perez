`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:40 04/17/2016 
// Design Name: 
// Module Name:    Reg_horas 
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
module Reg_horas(
    binary_inh   , //  4 bit binary input
	decoder_outh , //  16-bit  out
	ENh
);
input [3:0] binary_inh;
input ENh;
output reg [7:0] decoder_outh;

always@*
begin
	if(ENh)
	begin
	case (binary_inh) 
				4'b0000 : decoder_outh = 8'h1;
				4'b0001 : decoder_outh = 8'h2;
				4'b0010 : decoder_outh = 8'h3;
				4'b0010 : decoder_outh = 8'h4;
				4'b0011 : decoder_outh = 8'h5;
				4'b0100 : decoder_outh = 8'h6;
				4'b0101  : decoder_outh = 8'h7;
				4'b0110  : decoder_outh = 8'h9;
				4'b0111  : decoder_outh = 8'h10;
				4'b1000  : decoder_outh = 8'h11;
				4'b1001  : decoder_outh = 8'h12;
				default decoder_outh= 8'h0; 
		endcase
		 end
	
			
	else 
	decoder_outh= 8'h0;
end

endmodule
