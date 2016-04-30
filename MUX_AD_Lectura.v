`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:04 04/11/2016 
// Design Name: 
// Module Name:    MUX_AD_Lectura 
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
module MUX_AD_Lectura(
	input  AD1, RD1, CS1, WR1, sel, AD2, RD2, CS2, WR2,sel1,
	output reg AD, RD, CS ,WR
	);
	
	
	/*posedge sel, posedge sel1, posedge sel2, posedge AD2, posedge RD2, posedge CS2, posedge WR2,
	posedge AD1, posedge RD1, posedge CS1, posedge WR1, posedge ADMT, posedge RDMT*/
		always@*
		begin
		if (sel)
				begin
				//Para activar tiempos de lectura
				AD = AD2;// 
				RD = RD2;//
				CS = CS2;//
				WR = WR2;
				end
				
		else if(sel1)
			//Para activar tiempos de direccionamiento
				begin
				AD = AD1;//
				RD = RD1;//
				CS = CS1;//
				WR = WR1;
				end		
		else 
			begin
				AD = 1'b1;//
				RD = 1'b1;//
				CS = 1'b1;//
				WR = 1'b1;
				end	
		end
endmodule
