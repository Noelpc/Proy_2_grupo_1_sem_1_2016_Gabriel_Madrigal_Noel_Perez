`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:30 04/07/2016 
// Design Name: 
// Module Name:    count_mes 
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
module count_mes(
   input wire clkM,
		input wire resetM,
		input wire enM,
		input wire upM,
		input wire downM,
		output wire [3:0] qM
		
    );

//Signal Declarations
reg [3:0]q_actM, q_nextM;


//Body of "state" registers
always@(posedge clkM,posedge resetM)
	if(resetM)
		q_actM <= 4'b0;
	else
		q_actM <= q_nextM;
		
always@*
begin
	if(enM)
	begin
				if(upM) 
					begin
						if(qM < 4'd12) 
						begin
							q_nextM = q_actM + 4'b1;
						end
						else 
							q_nextM=0;		
					end
					else 
					q_nextM = 4'b0;
				end
					
				else if(downM)
				begin
						if (qM >= 4'b0) begin				
								q_nextM = q_actM- 4'sb1;
						end
						else 
							q_nextM=0;		
				end
				else 
						q_nextM = 0;
	end
	

//Output Logic
assign qM = q_actM;
 
endmodule
