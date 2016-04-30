`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:13:40 04/19/2016 
// Design Name: 
// Module Name:    Reg_Ano 
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
module Reg_Ano
(

input [6:0] binary_in,
input EN,
output reg [7:0] decoder_out
//output reg band_Fin
);

	
always@*
begin
	if(EN)
	begin
				case (binary_in) 
				7'b0000000 : decoder_out = 8'h1;
				7'b0000001 : decoder_out = 8'h2;
				7'b0000010 : decoder_out = 8'h3;
				7'b0000011 : decoder_out = 8'h4;
				7'b0000100 : decoder_out = 8'h5;
				7'b0000101 : decoder_out = 8'h6;
				7'b0000110  : decoder_out = 8'h7;
				7'b0000111  : decoder_out = 8'h8;
				7'b0001000  : decoder_out = 8'h9;
				7'b0001001  : decoder_out = 8'h10;
				7'b0001010  : decoder_out = 8'h11;
				7'b0001011  : decoder_out = 8'h12;
				7'b0001100 : decoder_out = 8'h13;
				7'b0001101 : decoder_out = 8'h14;
				7'b0001110 : decoder_out = 8'h15;
				7'b0001111 : decoder_out = 8'h16;
				7'b0010000 : decoder_out = 8'h17;
				7'b0010001 : decoder_out = 8'h18;
				7'b0010010  : decoder_out = 8'h19;
				7'b0010011  : decoder_out = 8'h20;
				7'b0010100  : decoder_out = 8'h21;
				7'b0010101  : decoder_out = 8'h22;
				7'b0010110  : decoder_out = 8'h23;
				7'b0010111 : decoder_out = 8'h24;
				7'b0011000 : decoder_out = 8'h25;////
				7'b0011001 : decoder_out = 8'h26;
				7'b0011010 : decoder_out = 8'h27;
				7'b0011011 : decoder_out = 8'h28;
				7'b0011100 : decoder_out = 8'h29;
				7'b0011101  : decoder_out = 8'h30;
				7'b0011110  : decoder_out = 8'h31;
				7'b0011111  : decoder_out = 8'h32;
				7'b0100000  : decoder_out = 8'h33;
				7'b0100001 : decoder_out = 8'h34;
				7'b0100010 : decoder_out = 8'h35;
				7'b0100011 : decoder_out = 8'h36;
				7'b0100100 : decoder_out = 8'h37;
				7'b0100101 : decoder_out = 8'h38;
				7'b0100110 : decoder_out = 8'h39;
				7'b0100111  : decoder_out = 8'h40;
				7'b0101000  : decoder_out = 8'h41;
				7'b0101001  : decoder_out = 8'h42;
				7'b0101010  : decoder_out = 8'h43;
				7'b0101011  : decoder_out = 8'h44;
				7'b0101100 : decoder_out = 8'h45;
				7'b0101101 : decoder_out = 8'h46;
				7'b0101110 : decoder_out = 8'h47;
				7'b0101111 : decoder_out = 8'h48;
				7'b0110000 : decoder_out = 8'h49;
				7'b0110001 : decoder_out = 8'h50;
				7'b0110010  : decoder_out = 8'h51;
				7'b0110011  : decoder_out = 8'h52;
				7'b0110100  : decoder_out = 8'h53;
				7'b0110101  : decoder_out = 8'h54;
				7'b0110110  : decoder_out = 8'h55;
				7'b0110111  : decoder_out = 8'h56;
				7'b0111000  : decoder_out = 8'h57;
				7'b0111001  : decoder_out = 8'h58;
				7'b0111010  : decoder_out = 8'h59;
				
				7'b0111011  : decoder_out = 8'h60;
				7'b0111100  : decoder_out = 8'h61;
				7'b0111101  : decoder_out = 8'h62;
				7'b0111111 : decoder_out = 8'h63;
				7'b1000000 : decoder_out = 8'h64;
				7'b1000001 : decoder_out = 8'h65;
				7'b1000010 : decoder_out = 8'h66;
				7'b1000011 : decoder_out = 8'h67;
				7'b1000100 : decoder_out = 8'h68;
				7'b1000101  : decoder_out = 8'h69;
				7'b1000110  : decoder_out = 8'h70;
				7'b1000111  : decoder_out = 8'h71;
				7'b1001000  : decoder_out = 8'h72;
				7'b1001001  : decoder_out = 8'h73;
				7'b1001010  : decoder_out = 8'h74;
				7'b1001011  : decoder_out = 8'h75;
				7'b1001100  : decoder_out = 8'h76;
				7'b1001101  : decoder_out = 8'h77;
				
				7'b1001110  : decoder_out = 8'h78;
				7'b1001111  : decoder_out = 8'h79;
				7'b1010000  : decoder_out = 8'h80;
				7'b1010001 : decoder_out = 8'h81;
				7'b1010010 : decoder_out = 8'h82;
				7'b1010011 : decoder_out = 8'h83;
				7'b1010100 : decoder_out = 8'h84;
				7'b1010101 : decoder_out = 8'h85;
				7'b1010110 : decoder_out = 8'h86;
				7'b1010111  : decoder_out = 8'h87;
				7'b1011000  : decoder_out = 8'h88;
				7'b1011001  : decoder_out = 8'h89;
				7'b1011010  : decoder_out = 8'h90;
				7'b1011011  : decoder_out = 8'h91;
				7'b1011100  : decoder_out = 8'h92;
				7'b1011101  : decoder_out = 8'h93;
				7'b1011110  : decoder_out = 8'h94;
				7'b1011111  : decoder_out = 8'h95;
				
				7'b1100000  : decoder_out = 8'h96;
				7'b1100001  : decoder_out = 8'h97;
				7'b1100010  : decoder_out = 8'h98;
				7'b1100011  : decoder_out = 8'h99;
		
		
		default : begin decoder_out= 8'h0;end 
	 endcase
	 
	end
	else  begin decoder_out= 8'h0;end
	
end

endmodule


