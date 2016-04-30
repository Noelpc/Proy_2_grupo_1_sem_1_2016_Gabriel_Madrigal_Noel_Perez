`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:03 04/17/2016 
// Design Name: 
// Module Name:    segundos 
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
module segundos(
	input En,
	output [7:0] DatosS,
	input UP,
	input DOWN,
	input clk,
	input reset,
	output  CSS,
	output  RDS,
	output  WRS,
	output  ADS
	
    );
	 wire [5:0]contador_reg;
	 wire seg;
	 
reg_segundos Registro (
    .binary_in(contador_reg), 
    .decoder_out(DatosS),  
    .EN(En)
    );
	 

count_segundos Contador(
    .clkseg(clk), 
    .resetseg(reset), 
    .enseg(seg), 
    .upseg(UP), 
    .downseg(DOWN), 
    .qseg(contador_reg)
    );
	 
	 
	Tiempo_escrituravb Escribe_seg (
    .clkW(clk), 
    .enW(En), 
    .resetW(reset), 
    .CS(CSS), 
    .RD(RDS), 
    .WR(WRS), 
    .AD(ADS), 
    .data(seg)
    );


endmodule
