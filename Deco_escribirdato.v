`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:04 04/22/2016 
// Design Name: 
// Module Name:    Deco_escribirdato 
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
module Deco_escribirdato(///contenido
input enE,
output reg band,
output reg [7:0]decoder_out,
input[2:0] cuentaE
    );

always@*
begin
	if(enE)
	begin
	case (cuentaE) 
				3'b000 : decoder_out = 8'h16;
				3'b001 : decoder_out = 8'h0;
				3'b010 : decoder_out = 8'b11010010;////////210////////
				3'b011: decoder_out= 8'h0;
			
		default decoder_out= 8'h0; 
		endcase
		end
	else 
	decoder_out= 8'h0;	
end
always@*
begin
		if(cuentaE==3'b100)begin
			band = 1'b1;end
		 
		 else
		 band = 1'b0;
	end
endmodule
