`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:28:55 04/21/2016 
// Design Name: 
// Module Name:    MUX_SELEC_DATOS 
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
module MUX_SELEC_DATOS(
input [3:0] band,
output reg [7:0]eleg_datos,
input [7:0] in_seg ,
input [7:0] in_min ,
input  [7:0] in_hour,
input  [7:0] in_dia,
input  [7:0] in_mes,
input  [7:0] in_ano,
input [7:0] in_dir
//input [7:0] in_seg_timer ,
//input [7:0] in_min_timer,
//input [7:0] in_hour_timer 
    );

always@*
begin 
	case(band)
		3'b0000: eleg_datos <= in_seg;
		3'b0001: eleg_datos <= in_min;
		3'b0010: eleg_datos <= in_hour;
		3'b0011: eleg_datos <= in_dia;
		3'b0100: eleg_datos <= in_mes;
		3'b0101: eleg_datos <= in_ano;
		//4'b0110: eleg_datos <= in_seg_timer;
		//4'b0111: eleg_datos <= in_min_timer;
		//4'b1000: eleg_datos <= in_hour_timer;
		default  eleg_datos<= in_dir;
	endcase
end
		
endmodule
