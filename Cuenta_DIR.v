`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:18 04/02/2016 
// Design Name: 
// Module Name:    Cuenta_DIR 
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
		module Cuenta_DIR(
    	input wire clkADD,
		input wire resetADD,
		input wire enADD, 
	input wire upADD,
		output wire [3:0] qADD	
    );
	 
	 
	 
	 reg [3:0]q_actADD, q_nextADD;


//Body of "state" registers
always@(posedge clkADD,posedge resetADD)
	if(resetADD)
		q_actADD <= 4'b0;
	else
		q_actADD <= q_nextADD;
		
always@*
begin
	if(enADD)
	begin
		if(upADD) 
			begin
			
				if(qADD < 4'd8) 
				begin
					q_nextADD = q_actADD + 4'b1;
				
				end
				else 
					q_nextADD = 4'b0;
			end
		else
			q_nextADD = 4'b0;
		end
	else
		q_nextADD = 4'b0;
			
end

assign qADD = q_actADD;
 
endmodule


/*		
always@*
begin
	if(clkADD) begin
		if(enADD)
			begin 
					if(qADD <= 4'd8) 
					begin
						q_nextADD = q_actADD + 4'b1;
					end
				else 
				q_nextADD  = 4'b0;
			end	
	end
	else
	q_nextADD = q_actADD;

	
end
assign qADD = q_actADD;
 
endmodule
*/