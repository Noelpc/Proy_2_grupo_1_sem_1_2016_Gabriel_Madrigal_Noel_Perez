`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:50:54 04/07/2016 
// Design Name: 
// Module Name:    count_segundos 
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
module count_segundos(
input wire clkseg,
		input wire resetseg,
		input wire enseg,
		input wire upseg,
		input wire downseg,
		output wire [5:0] qseg
		
    );

//Signal Declarations
reg [5:0]q_actseg, q_nextseg;


//Body of "state" registers
always@(posedge clkseg,posedge resetseg)
	if(resetseg)
		q_actseg <= 0;
	else
		q_actseg <= q_nextseg;

//Specified functions of the counter 		
always@*
begin
	if(enseg)
	begin
		if(upseg) 
			begin
				if(qseg < 6'd59) 
				begin
					q_nextseg = q_actseg + 6'b1;
				
				end
				else 
					q_nextseg = 6'b0;
			end
		else if(downseg)
			begin
				if (qseg >= 6'b0) 
					begin				
						q_nextseg = q_actseg - 6'sb1;
					end
				else 
					q_nextseg=6'b0;		
			end
		else 
			q_nextseg = q_actseg;
	end
	else 
		q_nextseg = q_actseg;


end

assign qseg = q_actseg;
 
endmodule	

/*		
always@*
begin
	if(enseg)
	begin
		if(upseg) 
			begin
				if(qseg < 6'd60) 
				begin
					q_nextseg = q_actseg + 6'b1;
				end
				
			end
			else 
			q_nextseg = 6'b0;
		end
			
	else if(downseg)
		begin
				if (qseg < 6'd60) begin				
						q_nextseg = q_actseg- 6'sb1;
				end
				else 
					q_nextseg=0;		
			end
		else 
			q_nextseg = q_actseg;
	end
	

	

//Output Logic
assign qseg = q_actseg;
 
endmodule
*/