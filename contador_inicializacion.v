`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:28 04/24/2016 
// Design Name: 
// Module Name:    contador_inicializacion 
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
module contador_inicializacion(
input En,
input clk,
input reset,
output [2:0] salida 
    );

reg [2:0]q_act, q_next;


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
			q_next = q_act + 1'b1;
		end
		else 
			q_next = 1'b0;

end

assign salida = q_act;
 
endmodule	
