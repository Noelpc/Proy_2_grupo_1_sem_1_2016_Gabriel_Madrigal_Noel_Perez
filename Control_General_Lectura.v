`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:40 04/11/2016 
// Design Name: 
// Module Name:    Control_General_Lectura 
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
module Control_General_Lectura(
input EN,
input RST,
input CLK,
output [7:0] Data_VGA,	//Datos que iran a la VGA
input [7:0] Data_RTC_in,	//Direcciones que irán a RTC
output [7:0] Data_RTC_out,
output AD,
output CS,
output RD,
output WR,
output band,
output wire [3:0] rd_flags
    );
	 
//wire [7:0] relev;
//assign Data_RTC = relev;

 
wire countTrans_FSM;
wire countADD_time_FSM;
wire count_lecture_time_FSM;
//wire [3:0] countADD_y_DecoDir;
wire [7:0] Mux_y_decoDir;
wire FSM_y_MuxDir;
//wire Band1_FSM;
//wire Band2_FSM;
wire selMuxTD;
wire ADL1; 
wire RDL1;  
wire CSL1; 
wire WRL1;  
wire ADL2;
//wire selT; 
wire RDL2; 
wire CSL2; 
wire WRL2;
//wire CountADDtime_CountADD;
//wire ADTr; 
//wire RDTr;
wire sel1Muxleerdato;
wire Band;
wire FSM_y_MuxData;
//wire [7:0] Data_RTC_trns_out;
//wire Mux_Trans;




FSM_Lectura Control_principal_lectura (
    .resetR(RST), 
    .EnRead(EN), 
	 .clkR(CLK),
    .Band_countADD_time_lecturaR(countADD_time_FSM), 
    .Band_count_time_lecturaR(count_lecture_time_FSM), 
    //.Band_fin_lect(Band_fin_lect), 
    //.Count_TransferR(countTrans_FSM),
	 //.MuxTransR(selT),//Para comando de transferencia
	 .SelTDR(selMuxTD),//Mux que selecciona Tiempo ADD 
	 .SelLR1(FSM_y_MuxDir), //Conectado en Mux FSM, RTC Y VGA,permite mandar datos a RTC 
	 .SelLR2(FSM_y_MuxData),//Conectado en Mux FSM, RTC Y VGA 
	 .Sel_DataLecR(sel1Muxleerdato),//Habilitacion de direccion para leer
	 //.En_Mux_transfer(Mux_Trans),
	 .bandMuxG(band)
    );
		
	/* Bandera_lect2 CLOCK(
    .clkB2(CLK), 
    .enB2(EN), 
    .resetB2(RST), 
    .Band2(Band)
    );
*//*
	 trasferencia_lectura Transferencia (
   .clkT(countTrans_FSM), 
    .resetT(RST), 
    .enT(EN), 
    .qT(Data_RTC_trns_out), 
    .ADT(ADTr), 
    .RDT(RDTr)
    );
	 */
	 //wire [3:0] rd_flags;
	 
	 ContadorDir_Deco_contrlADD Control_tiempos (
	// .up(EN),
    .En_FSM(countADD_time_FSM), 
    .Reset(RST), 
    .En(EN), 
    .Clk(CLK), 
    .outDecoDir(Mux_y_decoDir), 
    .CSL1(CSL1), 
    .RDL1(RDL1), 
    .WRL1(WRL1), 
    .ADL1(ADL1),
	 .rd_flags(rd_flags)
    );



	/* 
	 Control_Lectura Banderas_cambio_estado (
    .clkCL(CLK), 
    .resetCL(RST), 
    .enCL(EN),  
    .B1(Band1_FSM)
	 //.B2(Band2_FSM) 
    );
*/

Tiempo_Lectura Control_tiempo_lectura (
    .clkL(CLK), 
    .enL(count_lecture_time_FSM), 
    .resetL(RST), 
    .CS(CSL2), 
    .RD(RDL2), 
    .WR(WRL2), 
    .AD(ADL2)
    );
	 

 MUX_AD_Lectura Direccionamiento (
	
	//.ADMT(ADTr), 
    //.RDMT(RDTr),
    .AD1(ADL1), 
    .RD1(RDL1), 
    .CS1(CSL1), 
    .WR1(WRL1), 
    .AD2(ADL2), 
    .RD2(RDL2), 
    .CS2(CSL2), 
    .WR2(WRL2), 
    .AD(AD), 
    .RD(RD), 
    .CS(CS), 
    .WR(WR),
	 //.sel2(selT), //Habilita transferencia
	 .sel(sel1Muxleerdato), //habilita Tiempo para leer
	 .sel1(selMuxTD)//Habilita tiempo para direccionar
    );
	 
	 
	
Datos_Lectura MUX_Datos_lectura(
	// .In_Trans(Data_RTC_trns_out),
    .In_FSM(Mux_y_decoDir), 
    .In_RTC(Data_RTC_in), 
    .Sel1(FSM_y_MuxDir),
	 .Sel2(FSM_y_MuxData),
	// .Sel3(Mux_Trans),
    .Out_RTC(Data_RTC_out), 
    .Out_VGA(Data_VGA)
	 //.reset(RST)
    );



endmodule
