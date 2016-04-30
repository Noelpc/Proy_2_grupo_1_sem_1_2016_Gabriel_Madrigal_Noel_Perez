`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:50 04/18/2016 
// Design Name: 
// Module Name:    Control_Contador_Lectura 
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
module Control_Contador_Lectura(
//Band_clock1 ,
input resetL , 
input EnR , 
input clkL,
output reg SelL,//Para el control del módulo Mux encontrado en el exterior
output reg Band_countADD_time_lectura,//habilitara el contador que establece los parámetros de AD/CS/WR/RD/ para ADD
output reg Band_count_time_lectura,//Establece los parametros de AD/CS/WR/RD/ para lectura
output reg Sel_DataLec,
output reg MuxTrans,
output reg SelTD,//selecciona tiempos de direccion
output reg Count_Transfer);

reg [6:0]q_actL, q_nextL;
reg [6:0]q_actL1, q_nextL1;
always@(posedge clkL,posedge resetL)
	if(resetL) 
	begin
		q_actL <= 7'b0;
		q_actL1 <= 7'b0;
		
	end	
	else begin
		q_actL <= q_nextL;
		q_actL1 <= q_nextL1;end
		
always@*
begin
	if(EnR) begin
	
		if(q_actL <=7'b1001000) begin
			q_nextL = q_actL + 6'b1;
				if (q_actL  <= 7'b0001100) begin
						Count_Transfer <= 1'b1;
						MuxTrans <=1'b1;
						
						if (q_actL > 7'b0001100) begin
							Count_Transfer <= 1'b0;
							MuxTrans <=0; end
						else begin
							Count_Transfer <= 1'b0;
							MuxTrans <=1'b0; 
						end
				end
				else if(q_actL1 >= 7'b0011000) begin
						Band_countADD_time_lectura <= 1'b1;
						SelTD <= 1'b1;//Habilita direccion
						SelL <= 1'b1;//Manda direccion a RTC
						
							if (q_actL1 <=7'b0100110) begin
						SelTD <= 1'b0;//Habilita direccion
						SelL <= 1'bz;//Manda direccion a RTC
						Band_countADD_time_lectura <= 1'b0;end
							else begin
							SelTD <= 1'b0;//Habilita direccion
							SelL <= 1'bz;//Manda direccion a RTC
							Band_countADD_time_lectura <= 1'b0;end
					end
						
				else if ( q_actL1 >=7'b0110000)	begin
							Band_count_time_lectura <= 1'b1;
							Sel_DataLec<= 1'b1; 
							SelL <= 1'b0;// //Habilita datos de entrada, Manda datos a VGA
							if ( q_actL1 >=7'b0111110) begin
									Band_count_time_lectura <= 1'b0;
									Sel_DataLec<= 1'b0; 
									SelL <= 1'bz;
									end
							else begin 
									Band_count_time_lectura <= 1'b1;
									Sel_DataLec<= 1'b1; 
									SelL <= 1'b0;end
					end
				end
			else 
			q_actL <=7'b0000000;
			q_actL1 <=7'b0000000;
			end
		else
			q_actL <=7'b0000000;
			q_actL1 <=7'b0000000;
end				
					
endmodule

