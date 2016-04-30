`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:21 04/17/2016 
// Design Name: 
// Module Name:    Mes 
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
module Mes( 
    input En,
    input UP, 
    input DOWN, 
    input clk, 
    input reset,
	 output [7:0] DatosME,
	 output CSME,
	 output ADME,
	 output RDME,
	 output WRME
    );
    wire [3:0] count_deco;
	 wire mes;
	 
reg_mes Registro (
    .binary_in(count_deco), 
    .decoder_out(DatosME), 
    .EN(mes) 
    );
	 
count_mes Contador (
    .clkM(clk), 
    .resetM(reset), 
    .enM(En), 
    .upM(UP), 
    .downM(DOWN), 
    .qM(count_deco)
    );
	
Tiempo_escrituravb Mes (
    .clkW(clk), 
    .enW(En), 
    .resetW(reset), 
    .CS(CSME), 
    .RD(RDME), 
    .WR(WRME), 
    .data(mes), 
    .AD(ADME)
    );


endmodule
