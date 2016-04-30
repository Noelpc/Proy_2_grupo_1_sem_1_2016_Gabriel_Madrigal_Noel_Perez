`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:15 04/10/2016 
// Design Name: 
// Module Name:    Datos_Lectura 
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
module Datos_Lectura(
    input [7:0] In_FSM,
    input [7:0] In_RTC,
	 output reg [7:0] Out_RTC,
	 input Sel1,
	// input [7:0] In_Trans,
	 input Sel2,
	 //input Sel3,
    output reg [7:0] Out_VGA
	 
    );
	 
	 always@*
	 begin 
		if(Sel1==1 || Sel2==1) begin
					if(Sel1) begin
						Out_RTC = In_FSM;///Se envian los datos del FSM a RTC
						Out_VGA = 0;end
					else if(Sel2)begin
						Out_VGA = In_RTC;
						Out_RTC = 0;
						end
				/*	else if(Sel3) begin
						Out_RTC = In_Trans;
						Out_VGA = 0;
						end*/
					else begin
						Out_VGA = 0;
						Out_RTC=0;end
		end
		else
			begin 
				Out_VGA = 0;
				Out_RTC=0;end
		
	end
	
endmodule
	 
	 
/*	 	 
 reg [7:0] a , [7:0] b;    

 assign RTC = Sel1 ?  a: b;
 assign Out_VGA = b;
	 
always @*
begin 
   b <= RTC;
   a <= Out_VGA;
		//Manda datos de RTC a VGA   //Manda datos a RTC
end



*/
	/*
	case(Sel)
		1'b0: Out_RTC <= In_FSM;
		1'b1: Out_VGA <= In_RTC;
		default: begin  Out_RTC <=8'bz; Out_VGA <=8'bz;end	
	endcase
	
	end*/

