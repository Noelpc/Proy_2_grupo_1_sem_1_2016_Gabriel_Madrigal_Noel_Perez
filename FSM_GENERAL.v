`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:16 04/10/2016 
// Design Name: 
// Module Name:    FSM_GENERAL 
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

module FSM_GENERAL(
Iniciar, //Dará inicio al sistema
//Buttom_RIGHT,
//Buttom_LEFT,
Inicio_Lectura,
Inicio_Escritura,
CLK,
BandFin,
//Band1,
//Band2,
//Sel_Hora,
//Ctrl_time_WR,
//Ctrl_time_AD,
reset,
Buttom_SW,
count_ADD
//count_DATO,
//UP,
//DOWN
);

input Iniciar;
input Buttom_SW;
//input UP;
//input DOWN;
//input Buttom_RIGHT;
//input Buttom_LEFT;
//input Band1;//para el control de cambio de estados
//input Band2;//para el control de cambio de estados
input BandFin;//Estara dada por el count_ADD
input CLK;
input reset;
//output reg Ctrl_time_WR;
//output reg Ctrl_time_AD;
output reg Inicio_Lectura;
output reg Inicio_Escritura;
//output reg Sel_Hora;//Habilitacion para contador de formato 12 o 24
output reg count_ADD; //cuenta direcciones
//output reg count_DATO; //Se ocupa para escribir los datos en para inicializacion y los estados 


// Internal Variables
parameter  [2:0]   Inicio =  3'b000;
parameter [2:0] Inicializacion= 3'b0001;
/*parameter  [2:0]  Carga  =   3'b001;
parameter  [2:0]  Programa = 3'b010;
parameter  [2:0]  Estados  = 3'b011;
parameter  [2:0]  Escribe  = 3'b100;*/
parameter  [2:0]  Decide  =  3'b010;
parameter  [2:0]  ESCRITURA =3'b011;
parameter  [2:0]  LECTURA  =  3'b100;
reg [2:0] state, next_state;

always @ (state or Iniciar or Buttom_SW or BandFin)//Buttom_RIGHT  or Buttom_LEFT  or BandFin or UP or DOWN)
begin  
  next_state = 0;
  if(Iniciar) begin
		  case(state)
			 Inicio : 
			 if (Iniciar == 1'b1) begin
				  next_state = Inicializacion;
					  end else begin
				  next_state= Inicio; end
				  
				  			
			 Inicializacion : 
				if (BandFin == 1'b1) begin
				  next_state = Decide;
					  end 
				else begin
				  next_state = Inicializacion; end
		/*		  
			 Programa : 
						if (Band2 == 1'b1) begin
								if (BandFin ==1'b1) begin
									next_state = Estados;end
								else begin
									next_state = Inicio; end
						end
						else next_state = Programa;
									
			 Estados : 
					if (Band1 == 1'b1) begin
						next_state = Escribe;
					  end 
					else begin
						next_state = Estados;
					end
			  
			 Escribe: 
					if (Band2 == 1'b1)begin
							if (BandFin == 1'b1) begin
									next_state = Decide;end
							else 
								next_state = Estados;
					end
						else next_state = Escribe; 	
				*/
						
				Decide:  
						if (Buttom_SW == 1'b0) begin
								next_state = LECTURA;end
											
						else if(Buttom_SW == 1'b1) begin
										next_state = ESCRITURA; end 
						else 
								next_state = Decide;
			
						
				ESCRITURA:
							if(Buttom_SW == 1'b0) begin
								next_state = LECTURA;end
								
							else begin next_state = ESCRITURA;end
								
								
				LECTURA: 
							if(Buttom_SW == 1'b1) begin
								next_state = ESCRITURA;end
										
							else begin
								next_state = LECTURA; end
							
			default : next_state = Inicio; 
		  endcase
		end
end
always @ (posedge CLK)
			begin : OUTPUT_LOGIC
			  if (reset) begin
				Inicio_Lectura <=1'b0;
				Inicio_Escritura <=1'b0;
				//Sel_Hora <= 1'b0;
				//count_ADD<=0;
			  end 
			  else begin
				 state <=  next_state;
				 case(state)
				Inicio : begin
							  count_ADD<=1'b1;//INICIALIZACION 
							  
						 end
				/*
				 Carga	 : begin
							count_ADD  <= 1'b1;
							Ctrl_time_AD <=1'b1;
							
						 end
			  Programa	 : begin
							count_DATO <=1'b1;
							Ctrl_time_WR <=1'b1;
							
						 end
						 
				  
				 Estados: begin
									count_ADD<=1'b1 <=1'b1;
									Ctrl_time_AD <=1'b1;
								end
								
				  Escribe : begin
									
							count_DATO <=1'b1;
							Ctrl_time_WR <=1'b1;
							
								end
				*/
				
								
					ESCRITURA : begin
								  Inicio_Escritura <=1'b1;
								  state <= Inicio;

								end
								
					LECTURA : begin
								  Inicio_Lectura<=1'b1;
								  Inicio_Escritura <=1'b0;
								  state <= Inicio;
								  end
								  
				  default : begin
								  state <= Inicio;
								end
				 endcase
			  end
end

endmodule
