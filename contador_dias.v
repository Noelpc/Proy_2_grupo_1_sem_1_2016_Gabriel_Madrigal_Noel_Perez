`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:30 04/26/2016 
// Design Name: 
// Module Name:    contador_dias 
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
module contador_dias(
   input wire clkd,
		input wire resetd,
		input wire endd,
		input wire upd,
		input wire downd,
		output wire [2:0] qd
		
    );

//Signal Declarations
reg [2:0]q_actd, q_nextd;


//Body of "state" registers
always@(posedge clkd,posedge resetd)
	if(resetd)
		q_actd <= 0;
	else
		q_actd <= q_nextd;

//Specified functions of the counter 		
always@*
begin
	if(endd)
	begin
		if(upd) 
			begin
				if(qd < 3'd7) 
				begin
					q_nextd = q_actd + 1'b1;
				
				end
				else 
					q_nextd = 3'b0;
			end
		else if(downd)
			begin
				if (qd >= 3'b0) 
					begin				
						q_nextd = q_actd - 1'sb1;
					end
				else 
					q_nextd=3'b0;		
			end
		else 
			q_nextd = q_actd;
	end
	else 
		q_nextd = q_actd;


end

assign qd = q_actd;
 
endmodule	


