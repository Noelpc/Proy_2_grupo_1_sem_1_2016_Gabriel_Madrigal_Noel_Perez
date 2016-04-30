`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:16 04/10/2016 
// Design Name: 
// Module Name:    Tiempo_Lectura 
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
////Este módulo controlará los tiempos necesarios para leer en RTC///

module Tiempo_Lectura
(		input wire clkL,
		input wire enL,
		input resetL,
		output reg CS,
		output reg RD,
		output reg WR,
		output reg AD
		
    );

reg [3:0]q_actL, q_nextL;
always@(posedge clkL,posedge resetL)
	if(resetL) begin
		q_actL <= 4'b0;
		end
	else
		q_actL <= q_nextL;
		
always@*
begin
	if(enL) begin
		if(q_actL <=1001) begin
			q_nextL = q_actL + 4'b1;
				if (q_actL <= 4'b1000) begin
					AD<= 1'b1;end
				else 	AD <= 1'b0; 
			end
		else 		q_nextL = 0;
	end
	else begin q_nextL = 0;	AD <= 1'b0;end
end

always@*
begin
	if(enL) begin
		if(q_actL <=1001) begin
			q_nextL = q_actL + 4'b1;
			if (q_actL >= 4'b0010) begin
					RD<= 1'b0; 
						if (q_actL >= 4'b0111) begin 
							RD<= 1'b1; end
						else
							RD<= 1'b0; 
				end
				else 	RD<= 1'b1;
			end
			else q_nextL = q_actL; 
	end	
		else begin q_nextL = 0;	RD <= 1'b0;end
end



always@*
begin
	if(enL)
		begin 
		if(q_actL <=1001) begin
			q_nextL = q_actL + 4'b1;
				if (q_actL >= 4'b0001) begin
					WR<= 1'b0; 
						if (q_actL >= 4'b1000) begin 
							WR<= 1'b1; end
						else
							WR<= 1'b0; 
				end
				else 	WR<= 1'b1;
			end
			else q_nextL = 0; 
	end
	else begin q_nextL = 0;	WR <= 1'b0;end
end



always@*
begin
		if(enL)
		begin 
		if(q_actL <=1001) begin
			q_nextL = q_actL + 4'b1;
				if (q_actL >= 4'b0001) begin
					CS<= 1'b0; 
						if (q_actL >= 4'b1000) begin 
							CS<= 1'b1; end
						else
							CS<= 1'b0; 
				end
				else 	CS<= 1'b1;
			end
			else q_nextL = 0; 
	end
	else begin q_nextL = 0; 	CS <= 1'b0; end
end

endmodule





