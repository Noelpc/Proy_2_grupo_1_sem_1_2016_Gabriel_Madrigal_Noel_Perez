`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:12 04/17/2016 
// Design Name: 
// Module Name:    horas 
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
module horas(
    input En, 
    input UP, 
    input DOWN, 
    input clk, 
    input reset, 
    output [7:0] DatosH, 
    output CSH, 
    output ADH, 
    output RDH, 
    output WRH
    );


wire [3:0] c;
wire s;

Count_Formato_12 Formato_12 (
    .clk12(clk), 
    .reset12(reset), 
    .en12(s), 
    .up12(UP), 
    .down12(DOWN), 
    .q12(c)
    );
	 /*
Count_Formato_24 formato_24 (
    .clk24(clk24), 
    .reset24(reset24), 
    .en24(en24), 
    .up24(up24), 
    .down24(down24), 
    .q24(q24)
    );*/
	 
	 Tiempo_escrituravb Horas (
    .clkW(clk), 
    .enW(En), 
    .resetW(reset), 
    .CS(CSH), 
    .RD(RDH), 
    .WR(WRH), 
    .data(s), 
    .AD(ADH)
    );

Reg_horas HORAS (
    .binary_inh(c), 
    .decoder_outh(DatosH), 
    .ENh(En) 
    
    );
	 


endmodule
