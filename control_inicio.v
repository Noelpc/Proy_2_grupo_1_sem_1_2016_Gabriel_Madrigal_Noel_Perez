`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:14:21 04/26/2016 
// Design Name: 
// Module Name:    control_inicio 
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
module control_inicio(
input En,
input clk,
input reset,
output [5:0] salida 
    );

reg [5:0]q_act, q_next;


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
		if(salida <= 6'd48) 
				begin
					q_next = q_act + 6'b1;
				end
		else 
		q_next = 6'b0;
		
	end
	else 
		q_next =6'b0;


end

assign salida = q_act;
 
endmodule	
