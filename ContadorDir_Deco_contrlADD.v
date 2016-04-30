`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:29 04/17/2016 
// Design Name: 
// Module Name:    ContadorDir_Deco_contrlADD 
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

module ContadorDir_Deco_contrlADD(
input En_FSM,
input Reset,
input En,
input Clk,
output wire [7:0] outDecoDir, 
output wire CSL1, 
output wire RDL1, 
output wire WRL1, 
output wire ADL1,
output wire [3:0] rd_flags
    );
wire CountADDtime_CountADD;
wire [3:0] countADD_y_DecoDir;

assign rd_flags = countADD_y_DecoDir;

	 Cuenta_DIR Contador_ADD (
    .clkADD(CountADDtime_CountADD), 
    .resetADD(Reset), 
    .enADD(En),
	 .upADD(En),
    .qADD(countADD_y_DecoDir)
    );

	Deco_DIR Deco_Direcciones(
    .binary_in(countADD_y_DecoDir), 
    .decoder_out(outDecoDir),
	 //.band_Fin(Band_fin_lect),
	 .EN(CountADDtime_CountADD)
    );
	 
	 Tiempos_ADD Control_Tiempos_Direccion(
    .clkAD(Clk), 
    .enAD(En_FSM), 
    .resetAD(Reset), 
    .CS(CSL1), 
    .RD(RDL1), 
    .WR(WRL1), 
    .AD(ADL1),
	 .DIR(CountADDtime_CountADD)
    );

endmodule
