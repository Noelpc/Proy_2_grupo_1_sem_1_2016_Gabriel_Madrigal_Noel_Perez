`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:26 04/08/2016 
// Design Name: 
// Module Name:    FSM_Lectura 
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

module FSM_Lectura
(
//Band_clock1 ,
input resetR, 
input EnRead , 
input clkR,
output SelLR1,//Para el control del módulo Mux encontrado en el exterior
output  SelLR2,
output Band_countADD_time_lecturaR,//habilitara el contador que establece los parámetros de AD/CS/WR/RD/ para ADD
output  Band_count_time_lecturaR,//Establece los parametros de AD/CS/WR/RD/ para lectura
output  Sel_DataLecR,
//output  MuxTransR,
output bandMuxG,
//output En_Mux_transfer,
output  SelTDR//selecciona tiempos de direccion
//output  Count_TransferR
);

wire [6:0] cuenta;
////almacena las instrucciones//
Deco_FSM_lectura Registro (
    .count(cuenta), 
    //.EnR(EnRead), 
    .SelL1(SelLR1), 
    .SelL2(SelLR2), 
    .Band_countADD_time_lectura(Band_countADD_time_lecturaR), 
    .Band_count_time_lectura(Band_count_time_lecturaR), 
    .Sel_DataLec(Sel_DataLecR), 
    //.MuxTrans(MuxTransR), 
    .SelTD(SelTDR), 
	 //.MuxTransOut(En_Mux_transfer),
    //.Count_Transfer(Count_TransferR),
	 .bandMuxfin(bandMuxG)
    );
////Cuenta las intrucciones///
	contador_FSM_lectura Cuenta_Registro(
    .En(EnRead), 
    .clk(clkR), 
    .reset(resetR), 
    .salida(cuenta)
    );

endmodule


















/*
reg [6:0]q_actL1, q_nextL1;
reg [6:0]q_actL2, q_nextL2;
reg [6:0]q_actL3, q_nextL3;
 

always@(posedge clkL,posedge resetL)
	if(resetL) begin
		//q_actL <= 7'b0;
		q_actL1 <= 0;
		q_actL2 <= 0;
		q_actL3 <= 0;
		//Band_clock1 <=0;
		//SelL<=1'bz;//Para el control del módulo Mux encontrado en el exterior
		//Band_countADD_time_lectura=0;//habilitara el contador que establece los parámetros de AD/CS/WR/RD/ para ADD
		//Band_count_time_lectura<=0;//Establece los parametros de AD/CS/WR/RD/ para lectura
		//Sel_DataLec<=0;
		//MuxTrans <=0;
		//SelTD <=0;//selecciona tiempos de direccion
		//Count_Transfer <=0;
		end
		
	else begin
		q_actL1 <= q_nextL1;
		q_actL2 <= q_nextL2;
		q_actL3 <= q_nextL3;end
		
always@*
begin
	if(EnR) begin
		if(q_actL1 <= 7'b1000111) begin//cuenta llegara hasta 72
			q_nextL1 = q_actL1 + 7'b1;
				if (q_actL1  < 7'b0001101) begin
						Count_Transfer <= 1'b1;
						MuxTrans <=1'b1;
						SelL1 <= 1'b1;
						end
				else begin
						Count_Transfer <= 1'b0;
						MuxTrans <=0;
						SelL1 <= 1'b0;end
		end
				
		else begin
				q_nextL1  =0;
				Count_Transfer <= 1'b0;
				MuxTrans <=0;
				SelL1 <= 1'b0;
		end
	end
	else begin 
				q_nextL1  =0;
				Count_Transfer <= 1'b0;
				MuxTrans <=0;
				SelL1 <= 1'b0;end
end
always@(posedge clkL)
begin
	if(EnR) 
		begin
			if(q_actL2<=7'b1000111) begin
				q_nextL2 = q_actL2 + 6'b1;	
				
				if(q_actL2 >= 7'b0010111 && q_actL2 <= 7'b0100101 ) begin
						Band_countADD_time_lectura = 1;
						SelTD = 1'b1;//Habilita direccion b
						SelL1 = 1'b1;//Manda direccion a RTC
						
				end
				else begin	Band_countADD_time_lectura = 0;
								SelTD = 1'b0;
								SelL1 = 1'b0;
								
								end
		end
	else begin
			q_nextL2 =0;
			Band_countADD_time_lectura = 0;
			SelTD = 1'b0;
			SelL1 = 1'b0;end
					
	end
		else 	begin q_nextL2 = 0;
						Band_countADD_time_lectura = 0;
						SelTD = 1'b0;
						SelL1 = 1'b0;end
					
end
					
always@*
begin
	if(EnR)
		begin
			if(q_actL3<=7'b1000111) begin
					q_nextL3 = q_actL3 + 7'b1;	
						 if ( q_actL3 >= 7'b0101111 && q_actL3 >= 7'b0111101)begin
							Band_count_time_lectura <= 1'b1;
							Sel_DataLec<= 1'b1; 
							SelL2 <= 1'b1;// //Habilita datos de entrada, Manda datos a VGA
							end
						else begin 
								Band_count_time_lectura <= 1'b0;
								Sel_DataLec<= 1'b0; 
								SelL2 <= 1'b0;end
			end
			else begin
				q_nextL3  =0;
					Band_count_time_lectura <= 1'b0;
					Sel_DataLec<= 1'b0; 
					SelL2 <= 1'b0; end
		end
	else begin	q_nextL3  =0;
				Band_count_time_lectura <= 1'b0;
				Sel_DataLec<= 1'b0; 
				SelL2 <= 1'b0; end

end			
					
endmodule

*/

/*

module FSM_Lectura(

Band_clock1 , // Esta bandera proviene de un contador que cuenta hasta 10
//Band_clock2,//Esta bandera prpviene de otro contador que cuenta hasta 10
reset , // Reset de todo el sistema
EnR , //Habilita el sistema
//ADL , // Señal para AD del RTC
//CSL , // 
//RdL , // 
//WrL , // 
//BanderaGen,
//clock,
SelL,//Para el control del módulo Mux encontrado en el exterior
Band_countADD_time_lectura,//habilitara el contador que establece los parámetros de AD/CS/WR/RD/ para ADD
Band_count_time_lectura,//Establece los parametros de AD/CS/WR/RD/ para lectura
//Band_fin_lect,
Sel_DataLec,
MuxTrans,
SelTD,//selecciona tiempos de direccion

//Muxsel1,
Count_Transfer);
// Port declaration here
//input Band_fin_lect;
//input clock;
input Band_clock1 ; // 
//input Band_clock2;
input reset ; // Active high reset
input EnR ; ///Este botón hará que se termine el proceso de lectura
//output BanderaGen ; // 
//output ADL ; // 
//output CSL ; // 
//output RdL ; // 
//output WrL ; // 
//inout [7:0] DATA_DIR ;
//output reg Muxsel1;
output reg Count_Transfer;

output reg Band_countADD_time_lectura;
output reg Band_count_time_lectura;
output reg SelL;//Seleccion del mux mas exterior
output reg SelTD;//Seleccion de los tiempos de direccion
output reg MuxTrans;//Seleccion de Transferencia
output reg Sel_DataLec;//manda direccion para recibir datos lectura
*/
///********ESTADOS DE LECTURA*******//

/*
parameter  [3:0]  Espera = 		3'b000;
parameter  [3:0]  Prepara  = 		3'b001;
parameter  [3:0]  Transicion1  = 3'b010;
parameter  [3:0]  Lee  = 			3'b011;
parameter  [3:0]  Transicion2  = 3'b100;
parameter  [3:0]  Done  = 			3'b101;
//parameter  [3:0]  Fin_ciclo_Lectura  = 3'b110;

//reg [7:0] relevL;
//assign DATA_DIR =relevL;
reg [3:0] state, next_state;

always @ (state or Band_clock1)
begin   
	if(EnR) begin
  next_state = 0;
  case(state)
  
    Espera : if (Band_clock1 == 1'b1) begin
  	    	next_state = Prepara;
           end else 
		 next_state = Espera;
			
    Prepara : if ( Band_clock1== 1'b0) begin
  	       next_state = Transicion1;
           end else begin
	   next_state = Prepara;
	  end
	Transicion1: 
		if(Band_clock1==1'b1)  begin
			next_state = Lee;end
			else begin
					next_state = Transicion1;end
			
	  Lee: if(Band_clock1==1'b0) begin
			next_state = Done;		
			end
		else begin 
			next_state = Lee;end
			
		Transicion2: 
				if(Band_clock1==1'b1)  begin
				next_state = Transicion2;end
			else begin
					next_state = Done;end
					
    Done : if (Band_clock1 == 1'b0) begin
					//if (Band_fin_lect == 1'b1) begin
						//next_state = Fin_ciclo_Lectura;end
					//else 
						next_state = Prepara;
				end else 
							next_state = Done;
			
					
	  
    //Fin_ciclo_Lectura : if (Band_clock1 == 1'b1) begin
		//				 next_state = Prepara;
			//			end
				//		else next_state = Fin_ciclo_Lectura;
		  
 
   default : next_state = Prepara;
  endcase
end
end
///SALIDAS DE MAQUINA DE ESTADOS////
always @ (posedge Band_clock1)
begin : OUTPUT_LOGIC
  if (reset) begin
//  Count_ADD<=0;
  Band_countADD_time_lectura<=0;
  Band_count_time_lectura<=0;
  SelL <=0;
   Count_Transfer<=1'b0;
	MuxTrans <=1'b0;
     state <= Espera;
				  
  end else begin
    state <= next_state;
	  next_state = 0;
		case(state)
			Espera : begin 
							  Count_Transfer<=1'b1;
							  MuxTrans <=1'b1;
							  
							
							  end
				
			Prepara : begin 
	
									Band_countADD_time_lectura <= 1'b1;
										
										SelL <= 1'b1;//Manda direccion a RTC
										SelTD <= 1'b1;//Habilita direccion
											Band_count_time_lectura <= 1'b0;
									
				
					 end
			Lee : begin 
					
										
									Band_countADD_time_lectura <= 1'b0;
										Band_count_time_lectura <= 1'b1;
										Sel_DataLec<= 1'b1; 
										SelL <= 1'b0;// //Habilita datos de entrada, Manda datos a VGA
										 SelTD <= 1'b0; //Control de direcciones
						
	
					end
	
			  default : begin
							 state <= Espera; 	
							end
			 endcase
		end
	end
endmodule
*/
