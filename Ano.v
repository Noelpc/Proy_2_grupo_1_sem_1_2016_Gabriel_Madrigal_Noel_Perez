`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:38 04/17/2016 
// Design Name: 
// Module Name:    Ano 
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
module Ano(
	input En,
	output [7:0] DatosA,
	input UP,
	input DOWN,
	input clk,
	input reset,
	output CSA,
	output RDA,
	output WRA,
	output ADA
    );
	 
	 wire [6:0]contador_reg; 
	 wire ano;

count_ano cuenta_ano(
    .clkA(clk), 
    .resetA(reset), 
    .enA(ano), 
    .upA(UP), 
    .downA(DOWN), 
    .qA(contador_reg)
    );
	 
	 Reg_Ano Registro (
    .binary_in(contador_reg), 
    .EN(En), 
    .decoder_out(DatosA)
    );

	Tiempo_escrituravb Anos (
    .clkW(clk), 
    .enW(En), 
    .resetW(reset), 
    .CS(CSA), 
    .RD(RDA), 
    .WR(WRA), 
    .data(ano), 
    .AD(ADA)
    );
	 
endmodule
