
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:09 04/09/2016 
// Design Name: 
// Module Name:    Tiempo_escrituravb 
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
module Tiempo_escrituravb(
		input wire clkW,
		input wire enW,
		input resetW,
		output reg CS,
		output reg RD,
		output reg WR,
		output reg data, 
		output reg AD
		
		
    );

reg [3:0]q_actW, q_nextW,q_actAD1,q_nextAD1;
always@(posedge clkW,posedge resetW)
	if(resetW) begin
		q_actW <= 4'b0;
		q_actAD1 <=4'b0;
		/*CS<= 1'b0;
		RD<= 1'b0;
		WR<= 1'b0;
		AD<= 1'b0;*/
		end
	else begin
		q_actW <= q_nextW;
		q_actAD1 <= q_nextAD1; end
		
always@*
begin
	if(enW) begin
		if( q_actW <=1001) begin
			q_nextW = q_actW + 4'b1;
			if (q_actW <= 4'b1000) begin
				AD<= 1'b1;end
			else 	AD <= 1'b0; 
		end
		else 	AD <= 1'b0;AD <= 1'b0; 
	end
	else begin q_nextW = 0;	AD <= 1'b0;end
end

always@*
begin
		if(enW) begin
		if(q_actW <=1001) begin
			q_nextW = q_actW + 4'b1;
			if (q_actW  <= 4'b1000) begin
				RD<= 1'b1;end
			else 	RD <= 1'b0; 
		end
		else 	RD <= 1'b0;
	end
	else begin q_nextW = 0;	RD <= 1'b0;end
	
end

always@*
begin
	if(enW)
		begin 
		if(q_actW  <=1001) begin
			q_nextW = q_actW + 4'b1;
				if (q_actW  >= 4'b0010) begin
					WR<= 1'b0; 
						if (q_actW  >= 4'b0111) begin 
							WR<= 1'b1; end
						else
							WR<= 1'b0; 
				end
				else 	WR<= 1'b1;
			end
			else q_nextW = q_actW; WR<= 1'b0; 
	end	
		else begin q_nextW = 0;	WR <= 1'b0;end
end
always@*
begin
		if(enW)
		begin 
		if(q_actW  <=1001) begin
			q_nextW = q_actW + 4'b1;
				if (q_actW  >= 4'b0001) begin
					CS<= 1'b0; 
						if (q_actW  >= 4'b1000) begin 
							CS<= 1'b1; end
						else
							CS<= 1'b0; 
				end
				else 	CS<= 1'b1;
			end
			else q_nextW = q_actW; CS<= 1'b0;
	end
	else begin q_nextW = 0;	CS <= 1'b0;end
end


always@*
begin
		if(enW)
		begin 
		if(q_actAD1 <=4'd11) begin
				q_nextAD1 = q_actAD1 + 4'b1;
				if (q_actAD1 >= 4'd6) begin
					data<= 1'b1; 
				end
				else 	begin data<= 1'b0;end
			end
		else
		begin q_nextAD1 = 0; data<= 1'b0;end
	end
	else begin  q_nextAD1 = 0; 	data <= 1'b0; end
end

endmodule

