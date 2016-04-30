`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:01 04/21/2016 
// Design Name: 
// Module Name:    control_time_WR 
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
module control_time_WR(
input En_FSM,
input Reset,
input En,
input Clk,
input right,
input left,
output wire [7:0] outDecoDir, 
output wire CSL, 
output wire RDL, 
output wire WRL, 
output wire ADL,
output [3:0] bande
//output reg qADD
    );
assign bande = countADD_y_DecoDir;
wire dirleft;
wire dirright;
wire [3:0] countADD_y_DecoDir;


	 Cuenta_DIR_WR Contador_ADD (
    .clkADD(Clk), 
    .resetADD(Reset), 
    .enADD(En_FSM),
	 .upADD(dirright),
	 .downADD(dirleft),
    .qADD(countADD_y_DecoDir)
    );

	Deco_DIRW Deco_Direcciones(
    .binary_in(countADD_y_DecoDir), 
    .decoder_out(outDecoDir),
	 .EN(En)
    );
	 
	 
	 Tiempos_ADD Control_Tiempos_Direccion(
    .clkAD(Clk), 
    .enAD(right), 
    .resetAD(Reset), 
    .CS(CSL1), 
    .RD(RDL1), 
    .WR(WRL1), 
    .AD(ADL1),
	 .DIR(dirright)
    );
	 
	 Tiempos_ADD2 Control_Tiempos_Direccion2(
    .clkAD(Clk), 
    .enAD(left), 
    .resetAD(Reset), 
    .CS(CSL2), 
    .RD(RDL2), 
    .WR(WRL2), 
    .AD(ADL2),
	 .DIR(dirleft)
    );
	 
	 MUX_AD_Lectura MUX_Lectura(
    .AD1(ADL1), 
    .RD1(RDL1), 
    .CS1(CSL1), 
    .WR1(WRL1), 
    .sel(dirright), 
    .AD2(ADL2), 
    .RD2(RDL2), 
    .CS2(CSL2), 
    .WR2(WRL2),  
    .sel1(dirleft), 
    .AD(ADL), 
    .RD(RDL), 
    .CS(CSL), 
    .WR(WRL)
    );

endmodule
