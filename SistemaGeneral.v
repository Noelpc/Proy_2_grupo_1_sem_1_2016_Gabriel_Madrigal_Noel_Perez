`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:17:06 04/14/2016 
// Design Name: 
// Module Name:    SistemaGeneral 
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
module SistemaGeneral(
input Sw,
input EN_G,
input RST_G,
input B_UP,
input CLK_G,
input B_DOWN,
input B_RIGHT,
input B_LEFT,
//input inicio,
//input formato,//para establecer formato_hora
inout [7:0] D,
//output [7:0] Dout,
output  AD,
output  CS,
output  RD,
output  WR,
output wire hsync,
output wire vsync,
output wire [2:0] RGB_Out,
output wire CLKout
    );
	 
	 
assign CLKout = CLK_G;
wire READ;
wire WRR;
wire wire_DATOS;
wire [7:0] inicializacion;

wire [7:0] lectura;
wire [7:0] Data_VGA;
wire [7:0] escritura;

wire bandi;
wire [7:0] datain;
wire ADin;
wire CSin;
wire WRin;
wire RDin;
wire ADrd;
wire CSrd;
wire WRrd;
wire RDrd;
wire ADwr;
wire CSwr;
wire WRwr;
wire RDwr;
wire band_z;
wire Inicio_Lectura;
wire UP;
wire DOWN;
wire LEFT;
wire RIGHT;
wire [7:0] Datos_MUX_buff;
wire [7:0] Datos_a_lectura;



ctrl_botones Antirebote1(
    .clkr(CLK_G), 
    .levelr(B_UP), 
    .tickr(UP)
    );


controlbotones2 Antirebote2 (
    .clkr(CLK_G), 
    .levelr(B_DOWN), 
    .tickr(DOWN)
    );


controlbotones3 Antirebote3 (
    .clkr(CLK_G), 
    .levelr(B_RIGHT), 
    .tickr(RIGHT)
    );


controlbotones4 Antirebote4(
    .clkr(CLK_G), 
    .levelr(B_LEFT), 
    .tickr(LEFT)
    );


wire inicio_fsmg;


FSM_GENERAL Control_General (
    .Iniciar(EN_G), 
    .Inicio_Lectura(READ), 
    .Inicio_Escritura(WRR), 
    .CLK(CLK_G), 
    .BandFin(bandi), 
    //.Sel_Hora(Sel_Hora), 
    //.Ctrl_time_WR(Ctrl_time_WR), 
    //.Ctrl_time_AD(Ctrl_time_AD), 
    .reset(RST_G), 
    .count_ADD(inicio_fsmg),
		.Buttom_SW(Sw)
    //.count_DATO(count_DATO)
     );
	  
	  
//wire ADin, CDin,WRin,RDin;

///Aquí es donde RTC se inicializa///
Inicio Proceso_de_inicializacion (
    .EN(inicio_fsmg), 
    .clki(CLK_G), 
    .band(bandi), 
    .reset(RST_G), 
    .datainicio(datain), 
    .ADinicio(ADin), 
    .CSinicio(CSin), 
    .WRinicio(WRin), 
    .RDinicio(RDin)
    );
	 
	 wire [3:0] wr_flags;
	 
	 Control_General_Escritura Proceso_Escritura (
    .CLK(CLK_G), 
    .reset(RST_G), 
    .EN(WRR), 
    .UP(UP), 
    .RIGHT(RIGHT), 
    .LEFT(LEFT), 
    .DOWN(DOWN), 
    .data(escritura), 
    .ADW(ADwr),//////
	 .CSW(CSwr),
	 .WRW(WRwr),
	 .RDW(RDwr),
	 //.selec_mux_datos(selec_mux_datos), 
	 .wr_flags(wr_flags)
    );

 wire [3:0] rd_flags;

Control_General_Lectura Proceso_Lectura (
    .EN(READ), 
    .RST(RST_G), 
    .CLK(CLK_G), 
    .Data_VGA(Data_VGA), 
    .Data_RTC_in(Datos_a_lectura), 
    .Data_RTC_out(lectura), 
    .AD(ADrd), 
    .CS(CSrd), 
    .RD(RDrd), 
    .WR(WRrd),
	 .band(band_z),
	 .rd_flags(rd_flags)
    );

	 
	 MUX_FINAL MUX_GENERAL(
    .In_inicio(datain), 
    .In_lectura(lectura), 
    .In_escritura(escritura), 
    .a_buffer(Datos_MUX_buff),//Datos_MUX_buff 
    .Selin(inicio_fsmg), 
    .Selrd(READ), 
    .Selwr(WRR)
    );


Buffer Coneccion_a_RTC(
    .IN(band_z), 
    .clk(CLK_G), 
    .inp(Datos_MUX_buff ), 
    .outp(Datos_a_lectura), 
    .bidir(D)
    );
	 
	 
	 wire selin;
Mux_General_ADD  Mux_add_GEN(
    .ADi(ADin), 
    .RDi(RDin), 
    .CSi(CSin), 
    .WRi(WRin), 
    .seli(inicio_fsmg), 
    .ADr(ADrd), 
    .RDr(RDrd), 
    .CSr(CSrd), 
    .WRr(WRrd), 
    .selr(READ), 
    .ADw(ADwr), 
    .RDw(RDwr), 
    .CSw(CSwr), 
    .WRw(WRwr),
	 .selw(WRR),
    .AD(AD), 
    .RD(RD), 
    .CS(CS), 
    .WR(WR)
    );

// Instantiate the module
vga_top vga_unit (
    .clk(CLK_G), 
    .reset(RST_G), 
    .Sel(Sw), 
    .flag_rd(rd_flags), 
    .flag_wr(wr_flags), 
    .rtc_data_rd(Data_VGA), 
    .rtc_data_wr(Datos_MUX_buff), 
    .hsync(hsync), 
    .vsync(vsync), 
    .RGB_Out(RGB_Out)
    );


endmodule
