`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:05:23 04/21/2016 
// Design Name: 
// Module Name:    Cuenta_DIR_WR 
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
module Cuenta_DIR_WR(
    	input wire clkADD,
		input wire resetADD,
		input wire enADD, 
		input wire upADD,
		input wire downADD,
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
			
		else if(downADD)
			begin
				if (qADD >= 4'b0) 
					begin				
						q_nextADD = q_actADD - 4'sb1;
					end
				else 
					q_nextADD=4'b0;	
			end
		else 
			q_nextADD =0;
		
	end
	else 
		q_nextADD =0;


end

assign qADD = q_actADD;
 
endmodule


