`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:56 04/24/2016 
// Design Name: 
// Module Name:    Deco_FSM_lectura 
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
module Deco_FSM_lectura
(
input [6:0] count,
//input reset,
//input EnR, 
output SelL1,//Para el control del módulo Mux encontrado en el exterior
output  SelL2,
output  Band_countADD_time_lectura,//habilitara el contador que establece los parámetros de AD/CS/WR/RD/ para ADD
output  Band_count_time_lectura,//Establece los parametros de AD/CS/WR/RD/ para lectura
output  Sel_DataLec,//Manda configuracion de RD,CS,WR Y AD a RTC para leer
//output  MuxTrans,
//output MuxTransOut,
output  SelTD,//selecciona tiempos de direccion
output bandMuxfin);
//output  Count_Transfer);

reg  SelL1act,Band_countADD_time_lecturaact, SelTDact,Band_count_time_lecturaact,Sel_DataLecact,SelL2act;
reg 	MuxTransOutact;
reg bandMuxfinac;
 /*  
always@*
if (reset) begin
			Band_countADD_time_lecturaact = 0;
			SelTDact = 1'b0;
			SelL1act = 1'b0;
			Band_count_time_lecturaact = 1'b0;
			Sel_DataLecact= 1'b0; 
			SelL2act = 1'b0;
			Count_Transferact = 1'b0;end
*/
always@*
begin
	case(count)
	////Aqui se ejecuta el comando de transferencia///
			7'd0: begin
						//Count_Transferact <= 1'b1;
						//MuxTransact <= 1'b1;
						SelL1act <= 1'b1;
						//MuxTransOutact <=1'b1;
						Band_countADD_time_lecturaact <= 1'b0;
						SelTDact <= 1'b0;
						Band_count_time_lecturaact <= 1'b0;
						Sel_DataLecact<= 1'b0; 
						SelL2act <= 1'b0;
							bandMuxfinac<=1'b0;
						end
					
			7'd13:
				begin
						//Count_Transferact <= 1'b0;
						//MuxTransact <=1'b0;
						SelL1act <= 1'b0;
						Band_countADD_time_lecturaact <= 1'b0;
						SelTDact <= 1'b0;
						//MuxTransOutact<= 1'b0;
						Band_count_time_lecturaact <= 1'b0;
						Sel_DataLecact<= 1'b0; 
						SelL2act <= 1'b0;
							bandMuxfinac<=1'b0;
						end
					
						
			7'd27:
				begin	
						Band_countADD_time_lecturaact <= 1;
						SelTDact <= 1'b1;//Habilita direccion 
						SelL1act <= 1'b1;//Manda direccion a RTC
						//Count_Transferact <= 1'b0;
						//MuxTransact <=1'b0;
						Sel_DataLecact<= 1'b0; 
						SelL2act <= 1'b0;
						//MuxTransOutact<=1'b0;
						Band_count_time_lecturaact <= 1'b0;
						bandMuxfinac<=1'b1;
						
						end
		
						
			7'd41:
				begin
						Band_countADD_time_lecturaact <=1'b0;
						SelTDact <= 1'b0;//Habilita direccion 
						SelL1act <= 1'b0;
						Band_count_time_lecturaact <= 1'b0;
						Sel_DataLecact<= 1'b0; 
						SelL2act <= 1'b0;
						//MuxTransOutact<=1'b0;
						//MuxTransact <=1'b0;
						//Count_Transferact <= 1'b0;
							bandMuxfinac<=1'b0;
						end
					
			
						
									
			7'd55:
				begin
						Band_count_time_lecturaact <= 1'b1;
						Sel_DataLecact<= 1'b1; 
						SelL2act <= 1'b1;//Habilita datos de entrada, Manda datos a VGA
						//Count_Transferact <= 1'b0;
						//MuxTransact <=1'b0;
						Band_countADD_time_lecturaact <= 1'b0;
						SelTDact <= 1'b0; 
						SelL1act <= 1'b0;
						//MuxTransOutact<=1'b0;
							bandMuxfinac<=1'b0;
						end
			
										
			7'd70:begin
						Band_count_time_lecturaact <= 1'b0;
						Sel_DataLecact<= 1'b0; 
						SelL2act <= 1'b0;
						//Count_Transferact <= 1'b0;
						//MuxTransact <=1'b0;
						Band_countADD_time_lecturaact <= 1'b0;
						SelTDact <= 1'b0;
						SelL1act <= 1'b0;
						//MuxTransOutact <=1'b0;
							bandMuxfinac<=1'b0;
						
						end
			
			default : begin
					SelL1act<= SelL1act;
					SelL2act<= SelL2act;
					Band_countADD_time_lecturaact<= Band_countADD_time_lecturaact;
					Band_count_time_lecturaact<= Band_count_time_lecturaact;
					Sel_DataLecact<= Sel_DataLecact;
					//MuxTransact<= MuxTransact;
					SelTDact<= SelTDact;
					//Count_Transferact<= Count_Transferact;
					//MuxTransOutact <= MuxTransOutact;
					bandMuxfinac <=bandMuxfinac;
					end
					
		endcase
	
end

assign	SelL1 = SelL1act;
assign	SelL2 = SelL2act;
assign	Band_countADD_time_lectura = Band_countADD_time_lecturaact;
assign	Band_count_time_lectura = Band_count_time_lecturaact;
assign	Sel_DataLec = Sel_DataLecact;
//assign	MuxTrans = MuxTransact;
assign	SelTD = SelTDact;
//assign	Count_Transfer = Count_Transferact;
//assign  MuxTransOut =MuxTransOutact;
assign 	bandMuxfin =	bandMuxfinac;
		
endmodule
