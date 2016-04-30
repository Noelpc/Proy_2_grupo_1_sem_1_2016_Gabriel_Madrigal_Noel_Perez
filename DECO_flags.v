`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:32 04/19/2016 
// Design Name: 
// Module Name:    DECO_flags 
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
module DECO_flags(
    input wire [3:0] data_in,
    output reg [8:0] data_out			//{en_hour_sec, en_hour_min, en_hour_h, en_date_d,
    );											// en_date_m, en_date_y, en_cron_sec, en_cron_min, en_cron_h}

always @*
begin
	case (data_in)
		4'b0000: data_out = 9'b000000001;			// hora - segundos
		4'b0001: data_out = 9'b000000010;			// hora - minutos
		4'b0010: data_out = 9'b000000100;			// hora - horas
		4'b0011: data_out = 9'b000001000;			// fecha - dia
		4'b0100: data_out = 9'b000010000;			// fecha - mes
		4'b0101: data_out = 9'b000100000;			// fecha - año
		4'b0111: data_out = 9'b001000000;			// cronometro - segundos
		4'b1000: data_out = 9'b010000000;			// cronometro - minutos
		4'b1001: data_out = 9'b100000000;			// cronometro - horas
		default: data_out = 9'b000000000;			// ninguna bandera
	endcase
end

endmodule
