`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:54:11 04/18/2016 
// Design Name: 
// Module Name:    Control_General_Escritura 
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
module Control_General_Escritura(
input CLK,
input reset,
input EN,
input UP,
input RIGHT,
input LEFT,
input DOWN,
output [7:0] data,
output ADW,
output RDW,
output CSW,
output WRW,
//output wire [7:0] selec_mux_datos,
output wire [3:0] wr_flags
    );
	 
	 
wire [7:0]selec_mux_datos;	 
wire BUPs;
wire BUPm;
wire BUPh;
wire BUPd;
wire BUPme;
wire BUPa;
wire BDOWNs;
wire BDOWNm;
wire BDOWNh;
wire BDOWNd;
wire BDOWNme;
wire BDOWNa;
wire BRIGHT;
wire BLEFT;
wire countdir;
wire [7:0]DATOSS;
wire [7:0]DATOSMI;
wire [7:0]DATOSH;
wire [7:0]DATOSD;
wire [7:0]DATOSM;
wire [7:0]DATOSA;
wire clk;
wire [3:0] BANDERA;
//wire Band_cambio;
//wire CSW; 
//wire RDW; //
//wire WRW; //
//wire ADW;

	 
	 
	assign wr_flags = BANDERA;

	wire a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,sel; 
Bandera_lect2 CLOCK (//hace que trabaje a 10Mz
    .clkB2(CLK), 
    .enB2(EN), 
    .resetB2(reset), 
    .Band2(clk) );
  
	 
	 
wire A,B,C,D;

FSM_Escritura Control_Escritura (
    .clock(clk), 
    .reset(reset), 
    .Buttom_UP(UP), 
    .Buttom_RIGHT(RIGHT), 
    .Buttom_LEFT(LEFT), 
    .Buttom_DOWN(DOWN), 
    .EN(EN), 
    .En_countAdd(countdir), ///habilita control_dir
   .Band(BANDERA),//////para saltar de dir 
    //.contadorUP(BUP), 
    //.contadorDOWN(BDOWN), 
    //.Ctl_timeWR(Ctl_timeWR), 
    //.Ctl_timeADD(Ctl_timeADD), 
    .count_segUP(BUPs), 
    .count_minUP(BUPm), 
    .count_hourUP(BUPh), 
    .count_dayUP(BUPd), 
    .count_monthUP(BUPme), 
    .count_yearUP(BUPa), 
    .count_segDW(BDOWNs), 
    .count_minDW(BDOWNm), 
    .count_hourDW(BDOWNh), 
    .count_dayDW(BDOWNd), 
    .count_monthDW(BDOWNme), 
    .count_yearDW(BDOWNa)
    );
	 
	/// 
	 /*control_time_WR Control_direcciones (//controla las configuraciones para direccion
    .En_FSM(countdir), 
    .Reset(reset), 
    .En(EN), 
	 .qADD(selec_mux_datos),	
	 .left(LEFT),////////
	 .right(RIGHT),////////
    .Clk(CLK), 
    .outDecoDir(), ///MUX
    .CSL1(CSL1), 
    .RDL1(RDL1), 
    .WRL1(WRL1), 
    .ADL1(ADL1)
    );*/
	 
	 wire [7:0] datadir;
	 
	 control_time_WR Control_direcciones (
    .En_FSM(countdir), 
    .Reset(reset), 
    .En(EN), 
    .Clk(CLK), 
    .right(RIGHT), 
    .left(LEFT), 
    .outDecoDir(datadir), 
    .CSL(A),// 
    .RDL(B), //
    .WRL(C), //
    .ADL(D),//	
	 .bande(BANDERA)///permite cambiar de direccion
    );



	 
	 
	 ///MUX QUE SELECCIONA LOS DATOS 
	 
	 MUX_SELEC_DATOS Datos(
    .band(BANDERA), 
    .eleg_datos(data), 
    .in_seg(DATOSS), 
    .in_min(DATOSMI), 
    .in_hour(DATOSH), 
    .in_dia(DATOSD), 
    .in_mes(DATOSM), 
    .in_ano(DATOSA),
	 .in_dir(datadir)
    );

segundos SEGUNDOS(
    .En(EN), 
    .DatosS(DATOSS), 
    .UP(BUPs), 
    .DOWN(BDOWNs), 
    .clk(CLK), 
    .reset(reset), 
    .CSS(a), 
    .RDS(b), 
    .WRS(c), 
    .ADS(d)
    );


minutos_instan MINUTOS (
    .En(EN), 
    .DatosM(DATOSMI), //mux
    .UP(BUPm), 
    .DOWN(BDOWNm), 
    .clk(CLK), 
    .reset(reset),
	 //	output band,
	.RDM(e),
	.CSM(f),
	.WRM(g),
	.ADM(h)
    );


horas Horas (
    .En(EN), 
    .UP(BUPh), 
    .DOWN(BDOWNh), 
    .clk(CLK), 
    .reset(reset), 
    .DatosH(DATOSH), 
    .CSH(i), 
    .ADH(j), 
    .RDH(k), 
    .WRH(l)
    );



	
Dia Regitro (
    .En(EN), 
    .DatosD(DATOSD), 
    .UP(BUPd),
    .DOWN(BDOWNd), 
    .clk(CLK), 
    .reset(reset),
	.CSD(m),
	.RDD(n),
	.WRD(o),
	.ADD(p)
    );
	 
	 

Mes mes (
    .En(EN), 
    .DatosME(DATOSM), 
    .UP(BUPme), 
    .DOWN(BDOWNme), 
    .clk(CLK), 
    .reset(reset),
	.CSME(q), 
    .ADME(r), 
    .RDME(s), 
    .WRME(t)	 
    );

	 
Ano AnO(
    .En(EN), 
    .DatosA(DATOSA), 
    .UP(BUPa), 
    .DOWN(BDOWNa), 
    .clk(CLK), 
    .reset(reset),
	  .CSA(u), 
    .RDA(v), 
    .WRA(w), 
    .ADA(x)
    );

	 
MUX_GEN_ADD_wr ADD (
    .ADs(d), 
    .RDs(b), 
    .CSs(a), 
    .WRs(d), 
    .ADmin(e), 
    .RDmin(f), 
    .CSmin(g), 
    .WRmin(h), 
    .ADh(i), 
    .RDh(j), 
    .CSh(k), 
    .WRh(l), 
    //.selh(o), 
    .ADd(m), 
    .RDd(n), 
    .CSd(o),///// 
    .WRd(p), 
    //.seld(q) 
    .ADm(r), 						
    .RDm(s), 
    .CSm(q), 
    .WRm(t), 
    //.selm(selm), 
    .ADa(x), 
    .RDa(v), 
    .CSa(u), 
    .WRa(w),
		.WRdir(A),
		.CSdir(B),
		.RDdir(C),
		.ADdir(D),
    .band(BANDERA), 
    .AD(ADW), 
    .RD(RDW), 
    .CS(CSW), 
    .WR(WRW)
    );





endmodule
