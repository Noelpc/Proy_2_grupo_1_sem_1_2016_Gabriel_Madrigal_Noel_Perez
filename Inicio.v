`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:21:20 04/26/2016 
// Design Name: 
// Module Name:    Inicio 
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
module Inicio(
input EN,
input clki,
output band,
input reset,
output [7:0] datainicio,
output ADinicio, 
output CSinicio,
output WRinicio,
output RDinicio
    );
wire C1;

wire [5:0] cuenta_deco;

Inicializacion Principal(
    .clk(C1),  
    .SEL1(C1), 
    .SEL2(C2), 
    .resetI(reset), 
    .enI(EN), 
    .qI(datainicio), 
    .ADI(ADinicio), 
    .RDI(RDinicio), 
    .WRI(WRinicio), 
    .CSI(CSinicio),
	 .band(band)
    );
	 
control_inicio Cuentainicio (
    .En(EN), 
    .clk(clki), 
    .reset(reset), 
    .salida(cuenta_deco)
    );

deco_control_inicio DecoInicio(
    .count(cuenta_deco), 
    .CLK1(C1), 
    .CLK2(C2)
    );





endmodule
