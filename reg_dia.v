`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:07 04/14/2016 
// Design Name: 
// Module Name:    reg_dia 
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
module reg_dia(
   binary_in   , //  4 bit binary input
	decoder_out , //  16-bit  out
	EN
	);
input [2:0] binary_in;
input EN;

output reg [7:0] decoder_out;

	
always@*
begin
	if(EN)
	begin
	 
				case (binary_in) 
				4'b0000 : decoder_out = 8'h1;//Domingo
				4'b0001 : decoder_out = 8'h2;//Lunes
				4'b0010 : decoder_out = 8'h3;//Martes
				4'b0010 : decoder_out = 8'h4;//Miercoles
				4'b0011 : decoder_out = 8'h5;//Jueves
				4'b0100 : decoder_out = 8'h6;//Viernes
				4'b0101  : decoder_out = 8'h7;//Sabad0
		default: begin decoder_out= 8'h0;end 

		 endcase
		 end
		else begin decoder_out= 8'h0;end
end

endmodule
