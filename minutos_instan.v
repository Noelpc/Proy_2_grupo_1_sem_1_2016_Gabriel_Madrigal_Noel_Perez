`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:24:02 04/17/2016 
// Design Name: 
// Module Name:    minutos_instan 
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
module minutos_instan(
	input En,
	output [7:0] DatosM,
	input UP,
	input DOWN,
	input clk,
	input reset,
	//output band,
	output RDM,
	output CSM,
	output WRM,
	output ADM
    );
wire [5:0]contador_reg;
wire min;

reg_min Registro(
    .binary_in(contador_reg), 
    .EN(min), 
    .decoder_out(DatosM) 
    );

count_minutos Contador (
    .clkmin(clk), 
    .resetmin(reset), 
    .enmin(En), 
    .upmin(UP), 
    .downmin(DOWN), 
    .qmin(contador_reg)
    );
	 
	 Tiempo_escrituravb Minutos(
    .clkW(clk), 
    .enW(En), 
    .resetW(reset), 
    .CS(CSM), 
    .RD(RDM), 
    .WR(WRM), 
    .data(min), 
    .AD(ADM)
    );


endmodule
