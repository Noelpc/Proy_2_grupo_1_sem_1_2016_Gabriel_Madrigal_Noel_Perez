`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:41 04/21/2016 
// Design Name: 
// Module Name:    deco_inicio 
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
module deco_inicio(//Direcciones
input en,
output reg [7:0]datos,
input[2:0] cuenta
    );

always@*
begin
	if(en)
	begin
	case (cuenta) 
				3'b000 : datos = 8'h2;//Bit_inicio
				3'b001 : datos = 8'h2;//Bit_inicio
				3'b010 : datos = 8'h10;///Digital_Triming
				3'b011 : datos = 8'h0;	//frecuency_turning
			
		default datos= 8'h0;
		endcase
		 end
	else 
	datos= 8'h0;
end


endmodule
