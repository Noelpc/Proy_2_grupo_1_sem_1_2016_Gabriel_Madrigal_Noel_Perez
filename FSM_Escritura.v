`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:22:24 04/17/2016 
// Design Name: 
// Module Name:    FSM_Escritura 
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
module FSM_Escritura(
clock , // Clock
reset , // Active high reset
Buttom_UP , // Active high request from agent 0
Buttom_RIGHT , // Active high request from agent 2
Buttom_LEFT ,
Buttom_DOWN ,

//ctrl_time,
EN,
//En_count12,
//En_count24,
En_countAdd,
Band,
//contadorUP,
//contadorDOWN,
//Ctl_timeWR,
//Ctl_timeADD,
count_segUP,
count_minUP,
count_hourUP,
count_dayUP,
count_monthUP,
count_yearUP,
count_segDW,
count_minDW,
count_hourDW,
count_dayDW,
count_monthDW,
count_yearDW
);

//input ctrl_time
input clock ; // Clock
input EN;	//Este permititrá habilitar todala máquina de estados!! 
input [3:0] Band;// Estas banderas permitiran al estado de Wr a tomar decision de salto
input reset ; // Active high reset
input Buttom_UP ; // Active high request from agent 0
input Buttom_DOWN ; // Active high request from agent 1
input Buttom_RIGHT ; // Active high request from agent 2
input Buttom_LEFT ; // Active high request from agent 3
//output reg Ctl_timeADD;//Control de tiempo para direccionar
//output reg Ctl_timeWR;//Control de tiempo para Escribir
//output reg contadorUP;
//output reg contadorDOWN;
output reg count_segUP;
output reg count_minUP;
output reg count_hourUP;
output reg count_dayUP;
output reg count_monthUP;
output reg count_yearUP;
output reg En_countAdd;
output reg count_segDW;
output reg count_minDW;
output reg count_hourDW;
output reg count_dayDW;
output reg count_monthDW;
output reg count_yearDW;
// Internal Variables

//************ ESTADOS **************//
parameter  [3:0]  Espera  = 		4'b0000;
parameter  [3:0]  Ctrl_ADD  = 	4'b0001;
parameter  [3:0]  WR  = 			4'b0010;
parameter  [3:0]  Seg  = 			4'b0011;
parameter  [3:0]  Min  = 			4'b0100;
parameter  [3:0]  Hour  = 			4'b0101;
//parameter  [3:0]  START  = 		4'b0110;
parameter  [3:0]  Day  = 			4'b0110;
parameter  [3:0]  Month  = 		4'b0111;
parameter  [3:0]  Year  = 			4'b1000;
parameter  [3:0]  Seg_Timer  = 	4'b1001;
parameter  [3:0]  Min_Timer  = 	4'b1010;
parameter  [3:0]  Hour_Timer  = 	4'b1011;

reg [3:0] state, next_state;
//Parte secuencial del FSM///
always @ (state or Buttom_LEFT  or Buttom_UP or Buttom_RIGHT or Band or EN or Buttom_DOWN )
begin  
				if (EN) begin
				  next_state = 0;
				  
				  case(state)
					 Espera : if (EN== 1'b1) begin//switch
						  next_state= Ctrl_ADD;
						  end else begin
						  next_state = Espera; end
										
					  Ctrl_ADD: if (Buttom_LEFT == 1'b1) begin///buttom left
						  next_state = WR;
							  end 
							  else if(Buttom_RIGHT == 1'b1) begin//butttom right
							next_state =WR ;//WR
							end
							else next_state =Ctrl_ADD;
							
					 WR : if (Band == 4'b0000) begin
						  next_state = Seg;
							  end 
							  else begin //Los próximos estados de Wr serán controlados por bandera Band
							  case(Band)
								  4'b0001: next_state = Min;
								  4'b0010: next_state = Hour;
								  4'b0011: next_state = Day;
								  4'b0100: next_state = Month;
								  4'b0101: next_state = Year;
								  4'b0110: next_state = Seg_Timer;
								  4'b0111: next_state = Min_Timer;
								  4'b1000: next_state = Hour_Timer;
								  default : next_state = Seg;
								  endcase 
							  end			  
					 Seg : if (Buttom_LEFT == 1'b1) begin//o buttom right
						  next_state = WR;//Ctrl_ADD;
							  end 
							  else if(Buttom_RIGHT == 1'b1) begin
						  next_state = WR;//Ctrl_ADD;
						  end
						  else 
						  next_state = Seg;
					  
					 Min : if (Buttom_LEFT == 1'b1) begin//o buttom right
						  next_state = WR;//Ctrl_ADD;
							  end 
							  else if(Buttom_RIGHT == 1'b1) begin
						  next_state = WR;end
						  else 
						  next_state = Seg;
					  
					 Hour : if (Buttom_LEFT == 1'b1) begin//o buttom right
						  next_state = WR;
							  end 
							  else if(Buttom_RIGHT == 1'b1) begin
						  next_state = WR;end
						  else 
						  next_state = Hour;							
					/////////////
					 Day : if (Buttom_LEFT == 1'b1) begin//o buttom right
						  next_state = WR;//Ctrl_ADD;
							  end 
							  else if(Buttom_RIGHT == 1'b1) begin
						  next_state = WR;//Ctrl_ADD;
						  end
						  else 
						  next_state = Day;
						  
					 Month : if (Buttom_LEFT == 1'b1) begin//o buttom right
						  next_state = WR;//Ctrl_ADD;
							  end 
							  else if(Buttom_RIGHT == 1'b1) begin
						  next_state = WR;
						  end
						  else 
						  next_state = Month;
						  
					 Year : if (Buttom_LEFT == 1'b1) begin//o buttom right
						  next_state = WR;//Ctrl_ADD;
							  end 
							  else if(Buttom_RIGHT == 1'b1) begin
						  next_state = WR;//Ctrl_ADD;
						  end
						  else 
						  next_state = Year;
						  
						
					default : next_state = Espera;
				  endcase
				end
			else 
			 begin next_state = 0;end
end

///En esta otra parte se programan las salias de la maquina de estados.
//Parte combinacional//
always @ (posedge clock)
begin : OUTPUT_LOGIC
	if(EN==1) begin		
			  if (reset) begin
				 //Wr <= 1'b0;
				// Ctl_timeADD <=1'b0;
				 //Ctl_timeWR <=1'b0;
				 state <= Espera;
			  end else begin
				 state <=  next_state; end
				 if(EN) begin
						 case(state)
						Espera : begin
						//transfiere de mem ram reservada a la ram//
										//En_countAdd <= 1'b1;//Habilita contador de direccion
										//Ctl_timeADD <=1'b1;//Establece el control de tiempos de ADD en 1
										
										end
						Ctrl_ADD : begin
									 En_countAdd<=1'b1; //salta de direccion de memoria segun la cuenta
									//Ctl_timeADD <=1'b1; //Control de tiempos para escritura		
								 end
						WR: begin
							  case(Band)
										4'b0001: 	if (Buttom_UP == 1) begin
														count_segUP<= 1'b1;
														// Ctl_timeWR <=1'b1;
														end 
														
														else if (Buttom_DOWN == 1) begin
														count_segDW<= 1'b1;
														end
														else begin
															count_segDW<= 1'b0;
																count_segUP<= 1'b0;
													//	Ctl_timeWR <=1'b0;
														end 
									
														
														
														
									  4'b0010: 		if (Buttom_UP == 1) begin
														count_minUP<= 1'b1;
														//Ctl_timeWR <=1'b1;
														end 
														
														else if (Buttom_DOWN == 1) begin
														count_minDW<= 1'b1;
														//Ctl_timeWR <=1'b1;
														end
														else begin
															count_minDW<= 1'b0;
															count_minUP<= 1'b0;end
														//Ctl_timeWR <=1'b0; end
														
														
									  4'b0011: 		if (Buttom_UP == 1) begin
														count_hourUP<= 1'b1;
														//Ctl_timeWR <=1'b1;
														end 
														
														else if (Buttom_DOWN == 1) begin
														count_hourDW<= 1'b1;
														//Ctl_timeWR <=1'b1;
														end	
														else begin
															count_hourUP<= 1'b0;
															count_hourDW<= 1'b0;
														//Ctl_timeWR <=1'b0;end
														end
														
									  4'b0100: 		if (Buttom_UP == 1) begin
														count_dayUP<= 1'b1;
														//Ctl_timeWR <=1'b1;
														end 
													
														
														else if (Buttom_DOWN == 1) begin
														count_dayDW<= 1'b1;
														//Ctl_timeWR <=1'b1;
														end 
														else begin
															count_dayDW<= 1'b0;
														//Ctl_timeWR <=1'b0;
															count_dayUP<=1'b0;end
														
														
									  4'b0101: 		if (Buttom_UP == 1) begin
														count_monthUP<= 1'b1;
													//	Ctl_timeWR <=1'b1;
														end 
																											
														else if (Buttom_DOWN == 1) begin
														count_monthDW<= 1'b1;
														//Ctl_timeWR <=1'b1;
														end 
														else begin
															count_monthDW<= 1'b0;
													count_monthUP<=1'b0;
													//	Ctl_timeWR <=1'b0;end
														end

														
									  4'b0110: 		if (Buttom_UP == 1) begin
														count_yearUP<= 1'b1;
														//Ctl_timeWR <=1'b1;
														end 
														
														else if (Buttom_DOWN == 1) begin
														count_yearDW <= 1'b1;
														//Ctl_timeWR <= 1'b1;
														end 
														else begin
															count_yearDW<= 1'b0;
															count_yearUP<= 1'b0;
													//	Ctl_timeWR <=1'b0; end
													end
														
										default :  count_segUP <= 1'b0;
										endcase
							end
							  //4'b0111: next_state = Seg_Timer;
							  //4'b1000: next_state = Min_Timer;
							  //4'b1000: next_state = Hour_Timer;
							  
									  
						//	Seg:
								
							default : begin
										  state <= Espera;
									  end
								 
						endcase
					end
					
			end
			else 	 begin state <= Espera;end
end

	
endmodule

