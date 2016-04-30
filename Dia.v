`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:06 04/17/2016 
// Design Name: 
// Module Name:    Dia 
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
module Dia(
    input En, 
    output [7:0] DatosD, //mux
    input UP, 
    input DOWN, 
    input clk, 
    input reset, 
	 output CSD,
	 output RDD,
	 output WRD,
	 output ADD
    );
	wire [2:0]deCOUNT;
	wire dia;
	
reg_dia Registro (
    .binary_in(deCOUNT), 
    .decoder_out(DatosD),  
    .EN(dia)
    );
/*
contador_dias Contador_Dia(
    .clkd(clk), 
    .resetd(reset), 
    .en(En), 
    .upd(UP), 
    .downd(DOWN), 
    .qd(deCOUNT)
    );
	*/ 
	contador_dias cuenta_Dias(
    .clkd(clk), 
    .resetd(reset), 
    .endd(En), 
    .upd(UP), 
    .downd(DOWN), 
    .qd(deCOUNT)
    );



	 Tiempo_escrituravb Dia (
    .clkW(clk), 
    .enW(En), 
    .resetW(reset), 
    .CS(CSD), 
    .RD(RDD), 
    .WR(WRD), 
    .data(dia), 
    .AD(ADD)
    );







endmodule
