`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:49 04/09/2016 
// Design Name: 
// Module Name:    Bandera_lect2 
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
module Bandera_lect2(
		input wire clkB2,
		input wire enB2,
		input resetB2,
		output reg Band2
		
    );
	
reg [4:0]q_actB2, q_nextB2;
always@(posedge clkB2,posedge resetB2)
	if(resetB2) begin
		q_actB2 = 5'b0;
		
		end
	else begin
		q_actB2 = q_nextB2;end
		
always@*
begin
if(enB2)
	begin
	if (q_actB2 <= 5'b11000) begin
				q_nextB2 = q_actB2 + 5'b1;
				if (q_actB2 <= 5'b01010) begin
					Band2= 1'b1;
					end
				else begin
					Band2= 1'b0;end
	end
	else begin q_nextB2 =5'b0; Band2= 1'b0; end	
end
	else begin q_nextB2 =5'b0; Band2= 1'b0; end	
end

endmodule

