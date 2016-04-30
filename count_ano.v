`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:53:12 04/07/2016 
// Design Name: 
// Module Name:    count_ano 
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
module count_ano(
input wire clkA,
		input wire resetA,
		input wire enA,
		input wire upA,
		input wire downA,
		output wire [6:0] qA
		
    );

//Signal Declarations
reg [6:0]q_actA, q_nextA;


//Body of "state" registers
always@(posedge clkA,posedge resetA)
	if(resetA)
		q_actA <= 7'b0;
	else
		q_actA <= q_nextA;
		
always@*
begin
	if(enA)
	begin
		if(upA) 
			begin
				if(qA <= 7'd99) 
				begin
					q_nextA = q_actA + 7'b1;
				end
			else 
			q_nextA = 7'b0;
		end
			
	else if(downA)
		begin
				if (qA >= 7'b0) begin				
						q_nextA = q_actA - 7'sb1;
					end
				else 
					q_nextA=7'b0;		
			end
		else 
			q_nextA = q_actA;
	end else 
	q_nextA = 0;
end
//Output Logic
assign qA = q_actA;
 
endmodule
