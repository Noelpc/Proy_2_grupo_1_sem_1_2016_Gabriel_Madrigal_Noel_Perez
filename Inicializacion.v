`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:34:53 04/18/2016 
// Design Name: 
// Module Name:    Inicializacion 
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
module Inicializacion(
   	input clk,
		input SEL1,
		input SEL2,
		input resetI,
		input enI,
		output band,
		output  [7:0] qI,
		output  ADI,
		output  RDI,
		output  WRI,
		output  CSI
    );
	 

wire d;//recorre lo que hay en laqs direcciones
wire cuentaI;
wire [7:0] data;
wire [7:0] dir;
wire rd1;
wire ad1;
wire cs1;
wire wr1;
wire rd2;
wire ad2;
wire cs2;
wire wr2;
wire [2:0] salida2;
wire [2:0] salida1;
///


////establece las direcciones////
Tiempos_ADD DIR (
    .clkAD(clk), 
    .enAD(enI), 
    .resetAD(resetI), 
    .CS(cs1), 
    .RD(rd1), 
    .WR(wr1), 
    .AD(ad1), 
    .DIR(DIR_clk)
    );




//Establece los datos///

Tiempo_escrituravb  datos(
    .clkW(clk), 
    .enW(enI), 
    .resetW(resetI), 
    .CS(cs2), 
    .RD(rd2), 
    .WR(wr2), 
    .AD(ad2), 
    .data(Dir_clk)
    );



//cuenta direcciones///
contador_inicializacion cuenta_dir (
    .En(enI), 
    .clk(DIR_clk), 
    .reset(resetI), 
    .salida(salida2)
    );
	 
	 
///para recorrer los datos
contador_para_wr_in otrocontador (
    .En(enI), 
    .clk(Dir_clk), 
    .reset(resetI), 
    .salida(salida1)
    );
	 
//guarda direcciones//
deco_inicio Direccion (
    .en(enI), 
    .datos(dir), 
    .cuenta(salida2)
    );
	 
//guarda contenido//
Deco_escribirdato Contenido (
    .enE(enI), 
    .decoder_out(data), 
    .cuentaE(salida1), 
	 .band(band)
    );
//control con RTC//
mux_inicio Selec_dir_data (
    .In_data(data), 
    .In_dir(dir), 
    .Out_RTC(qI), 
    .Sel1(SEL1), ////FSM
    .Sel2(SEL2),////FSM
    .AD1(ad1), 
    .RD1(rd1), 
    .CS1(cs1), 
    .WR1(wr1),  
    .AD2(ad2), 
    .RD2(rd2), 
    .CS2(cs2), 
    .WR2(wr2), 
    .AD(ADI), 
    .RD(RDI), 
    .CS(CSI), 
    .WR(WRI)
    );
    


endmodule




/*
Specified functions of the counter 		
always@(posedge clkT)
begin
	if(enT)
	begin
			q_nextT <= q_actT + 6'b1;
			if ( q_actT <=6'd10) begin
				ADT<= 1'b0;
				qT <= 8'b00000010;
			else if(q_actT >= 6'd20)begin
					ADT<= 1'b0;
				qT <= 8'b00000010;
					if(q_actT <=6'b11111) begin
							ADT<=1'b1;
							RDT<= 1'b1;
							qT<= 8'bz;end
					end
					
			else begin
			ADT<= 1'bz;
			qT<= 8'bz;
			RDT<=1'bz;end
	end
	else begin
			ADT<= 1'bz;
			qT<= 8'bz;
			RDT<=1'bz;
			q_nextT <= q_actT;
			end

end
 
endmodule

*/


