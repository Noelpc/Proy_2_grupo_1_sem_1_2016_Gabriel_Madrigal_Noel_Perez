`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:38:34 04/14/2016 
// Design Name: 
// Module Name:    reg_min 
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
module reg_min(
input [5:0] binary_in,
input EN,
output reg [7:0] decoder_out
);
	
always@*
begin
	if(EN)
	begin
				case (binary_in) 
				6'b000000 : decoder_out = 8'h1;
				6'b000001 : decoder_out = 8'h2;
				6'b000010 : decoder_out = 8'h3;
				6'b000011 : decoder_out = 8'h4;
				6'b000100 : decoder_out = 8'h5;
				6'b000101 : decoder_out = 8'h6;
				6'b000110  : decoder_out = 8'h7;
				6'b000111  : decoder_out = 8'h8;
				6'b001000  : decoder_out = 8'h9;
				6'b001001  : decoder_out = 8'h10;
				6'b001010  : decoder_out = 8'h11;
				6'b001011  : decoder_out = 8'h12;
				6'b001100 : decoder_out = 8'h13;
				6'b001101 : decoder_out = 8'h14;
				6'b001110 : decoder_out = 8'h15;
				6'b001111 : decoder_out = 8'h16;
				6'b010000 : decoder_out = 8'h17;
				6'b010001 : decoder_out = 8'h18;
				6'b010010  : decoder_out = 8'h19;
				6'b010011  : decoder_out = 8'h20;
				6'b010100  : decoder_out = 8'h21;
				6'b010101  : decoder_out = 8'h22;
				6'b010110  : decoder_out = 8'h23;
				6'b010111 : decoder_out = 8'h24;
				6'b011000 : decoder_out = 8'h25;////
				6'b011001 : decoder_out = 8'h26;
				6'b011010 : decoder_out = 8'h27;
				6'b011011 : decoder_out = 8'h28;
				6'b011100 : decoder_out = 8'h29;
				6'b011101  : decoder_out = 8'h30;
				6'b011110  : decoder_out = 8'h31;
				6'b011111  : decoder_out = 8'h32;
				6'b100000  : decoder_out = 8'h33;
				6'b100001 : decoder_out = 8'h34;
				6'b100010 : decoder_out = 8'h35;
				6'b100011 : decoder_out = 8'h36;
				6'b100100 : decoder_out = 8'h37;
				6'b100101 : decoder_out = 8'h38;
				6'b100110 : decoder_out = 8'h39;
				6'b100111  : decoder_out = 8'h40;
				6'b101000  : decoder_out = 8'h41;
				6'b101001  : decoder_out = 8'h42;
				6'b101010  : decoder_out = 8'h43;
				6'b101011  : decoder_out = 8'h44;
				6'b101100 : decoder_out = 8'h45;
				6'b101101 : decoder_out = 8'h46;
				6'b101110 : decoder_out = 8'h47;
				6'b101111 : decoder_out = 8'h48;
				6'b110000 : decoder_out = 8'h49;
				6'b110001 : decoder_out = 8'h50;
				6'b110010  : decoder_out = 8'h51;
				6'b110011  : decoder_out = 8'h52;
				6'b110100  : decoder_out = 8'h53;
				6'b110101  : decoder_out = 8'h54;
				6'b110110  : decoder_out = 8'h55;
				6'b110111  : decoder_out = 8'h56;
				6'b111000  : decoder_out = 8'h57;
				6'b111001  : decoder_out = 8'h58;
				6'b111010  : decoder_out = 8'h59;

		
		default:begin decoder_out= 8'h0;end 

		 endcase
	end
	else
		begin decoder_out= 8'h0;end
	
end

endmodule

