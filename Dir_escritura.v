`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:50:10 04/19/2016 
// Design Name: 
// Module Name:    Dir_escritura 
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
module Dir_escritura(
 input [3:0] binary_in, //  
	output reg [7:0] decoder_out,  //  
	//output reg band_Fin,
	input EN

);


always@*
begin
	if (EN)  begin
	case (binary_in) 
							4'b0000 : decoder_out = 8'bz;
							4'b0001 : decoder_out = 8'h21;
							4'b0010 : decoder_out = 8'h22;
							4'b0011 : decoder_out = 8'h23;
							4'b0100 : decoder_out = 8'h24;
							4'b0101 : decoder_out = 8'h25;
							4'b0110  : decoder_out = 8'h26;
							4'b0111  : decoder_out = 8'h27;
							4'b1000  : decoder_out = 8'h28;
							default: decoder_out = 8'hz; 
			endcase
		end
		else 
		decoder_out = 8'hz;
	end
 
endmodule

