`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:25 04/24/2016 
// Design Name: 
// Module Name:    contador_FSM_lectura 
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
module contador_FSM_lectura(
input En,
input clk,
input reset,
output [6:0] salida 
    );

reg [6:0]q_act, q_next;


//Body of "state" registers
always@(posedge clk,posedge reset)
	if(reset) begin
		q_act<= 0;end
	else
		q_act <= q_next;

//Specified functions of the counter 		
always@*
begin
	if(En)
	begin
		if(salida <= 7'd83) 
				begin
					q_next = q_act + 7'b1;
				end
		else 
		q_next = 7'b0;
		
	end
	else 
		q_next =7'b0;


end

assign salida = q_act;
 
endmodule	

