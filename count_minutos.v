`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:50:16 04/07/2016 
// Design Name: 
// Module Name:    count_minutos 
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
module count_minutos(
  input wire clkmin,
		input wire resetmin,
		input wire enmin,
		input wire upmin,
		input wire downmin,
		output wire [5:0] qmin
		
    );

//Signal Declarations
reg [5:0]q_actmin, q_nextmin;


//Body of "state" registers
always@(posedge clkmin,posedge resetmin)
	if(resetmin)
		q_actmin <= 0;
	else
		q_actmin <= q_nextmin;

//Specified functions of the counter 		
always@*
begin
	if(enmin)
	begin
		if(upmin) 
			begin
				if(qmin < 6'd59) 
				begin
					q_nextmin = q_actmin + 6'b1;
				
				end
				else 
					q_nextmin = 6'b0;
			end
		else if(downmin)
			begin
				if (qmin >= 6'b0) 
					begin				
						q_nextmin = q_actmin - 6'sb1;
					end
				else 
					q_nextmin=6'b0;		
			end
		else 
			q_nextmin = q_actmin;
	end
	else 
		q_nextmin= q_actmin;


end

assign qmin = q_actmin;
 
endmodule	
