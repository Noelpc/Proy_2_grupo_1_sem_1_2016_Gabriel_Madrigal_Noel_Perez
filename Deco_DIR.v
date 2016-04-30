`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:46 04/02/2016 
// Design Name: 
// Module Name:    Deco_DIR 
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
module Deco_DIR(
   input [3:0] binary_in, //  
	output reg [7:0] decoder_out,  //  
	//output reg band_Fin,
	input EN

);


always@*
begin
	if (EN)  begin
	case (binary_in) 
							4'b0000 : decoder_out = 8'b11110000;
							4'b0001 : decoder_out = 8'h21;//
							4'b0010 : decoder_out = 8'h22;//
							4'b0011 : decoder_out = 8'h23;//
							4'b0100 : decoder_out = 8'h24;//
							4'b0101 : decoder_out = 8'h25;//
							4'b0110  : decoder_out = 8'h26;//
							4'b0111  : decoder_out = 8'h41;//seg_timer
							4'b1000  : decoder_out = 8'h42;//min_timer
							4'b1001  : decoder_out = 8'h43;//hora_timer
							default: decoder_out = 8'h0; 
			endcase
		end
		else 
		decoder_out = 8'h0;
	end
 
endmodule
