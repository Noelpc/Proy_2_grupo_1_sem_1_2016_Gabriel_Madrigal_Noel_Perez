`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:21 04/10/2016 
// Design Name: 
// Module Name:    Tiempos_ADD 
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
module Tiempos_ADD
(		input wire clkAD,
		input wire enAD,
		input resetAD,
		output reg CS,
		output reg RD,
		output reg WR,
		output reg AD,
		output reg DIR
		
    );

reg [3:0]q_actAD;
reg [3:0]q_nextAD;
reg [3:0]q_actAD1;
reg [3:0]q_nextAD1;

always@(posedge clkAD,posedge resetAD)
	if(resetAD) begin
		q_actAD <= 4'b0;
		q_actAD1 <= 4'b0;
		end
	else  begin
		q_actAD <= q_nextAD;
		q_actAD1 <= q_nextAD1;
		end
	
		
	
		
always@*
begin
	if(enAD) begin
		if(q_actAD <=4'd11) begin
			q_nextAD = q_actAD + 4'b1;
			if (q_actAD <= 4'd10) begin
				AD <= 1'b0;end
			else 	AD <= 1'b1; 
		end
		else 		q_nextAD = 4'b0;	AD <= 1'b1; 
	end
	else begin q_nextAD = 4'b0;	AD <= 1'b0;end
end

always@*
begin
	if(enAD) begin
		if(q_actAD <= 4'd11) begin
			q_nextAD = q_actAD + 4'b1;
			if (q_actAD <= 4'd11) begin
				RD<= 1'b1;end
			else 	RD <= 1'b1; 
		end
		else 		q_nextAD = 4'b0; RD <= 1'b0;
	end
	else begin q_nextAD = 4'b0;	
			RD <= 1'b0;end
end

always@*
begin
	if(enAD)
		begin 
		if(q_actAD <=4'd11) begin
			q_nextAD = q_actAD + 4'b1;
				if (q_actAD >=4'd2) begin
					WR<= 1'b0; 
						if (q_actAD >=4'd8) begin 
							WR<= 1'b1; end
						else
							WR<= 1'b0; 
				end
				else 	WR<= 1'b1;
			end
			else begin q_nextAD = 4'b0;WR<= 1'b0; end  
	end
	else begin q_nextAD = 4'b0;	WR <= 1'b0;end
end
always@*
begin
		if(enAD)
		begin 
		if(q_actAD <=4'd11) begin
			q_nextAD = q_actAD + 4'b1;
				if (q_actAD >= 4'd1) begin
					CS<= 1'b0; 
						if (q_actAD >= 4'd10) begin 
							CS<= 1'b1; end
						else
							CS<= 1'b0; 
				end
				else 	CS<= 1'b1;
			end
		else begin q_nextAD = 4'b0; CS<= 1'b1;end
	end
	else begin q_nextAD = 0; 	CS <= 1'b0; end
end

always@*
begin
		if(enAD)
		begin 
		if(q_actAD1 <=4'd13) begin
				q_nextAD1 = q_actAD1 + 4'b1;
				if (q_actAD1 >= 4'd6) begin
					DIR<= 1'b1; 
				end
				else 	begin DIR<= 1'b0;end
			end
		else
		begin q_nextAD1 = 0; DIR<= 1'b0;end
	end
	else begin  q_nextAD1 = 0; 	DIR <= 1'b0; end
end


endmodule
