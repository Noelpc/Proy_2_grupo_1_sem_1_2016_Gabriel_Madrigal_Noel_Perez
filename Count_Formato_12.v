`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:13 04/05/2016 
// Design Name: 
// Module Name:    Count_Formato_12 
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
////////////Este contador hará la cuenta en formato 12 horas///////
module Count_Formato_12(
  input wire clk12,
		input wire reset12,
		input wire en12,
		input wire up12,
		input wire down12,
		output wire [3:0] q12
		
    );

//Signal Declarations
reg [3:0]q_act12, q_next12;


//Body of "state" registers
always@(posedge clk12,posedge reset12)
	if(reset12)
		q_act12 <= 0;
	else
		q_act12 <= q_next12;

//Specified functions of the counter 		
always@*
begin
	if(en12)
	begin
		if(up12) 
			begin
				if(q12 < 4'd12) 
				begin
					q_next12 = q_act12 + 1'b1;
				
				end
				else 
					q_next12 = 4'b0;
			end
		else if(down12)
			begin
				if (q12 >= 4'b0) 
					begin				
						q_next12 = q_act12 - 1'sb1;
					end
				else 
					q_next12=4'b0;		
			end
		else 
			q_next12 = q_act12;
	end
	else 
		q_next12= q_act12;


end

assign q12= q_act12;
 
endmodule	
































/*
module Count_Formato_12(
input wire clk12,
		input wire reset12,
		input wire en12,
		input wire up12,
		input wire down12,
		output wire [3:0] q12
		
    );

//Signal Declarations
reg [3:0]q_act12, q_next12;
//
//assign 	q_act12 =  
//Body of "state" registers

always@(posedge clk12, posedge reset12)
begin
	if(reset12) 
		begin
		q_act12 <= 4'b0;end
	else
		q_act12 <= q_next12;
end
	
always@*
begin
	if(en12)
	begin
		if(up12) 
			begin
				if(q12 < 4'd12) 
				begin
					q_next12 = q_act12 + 4'b1;
				end
				
			end
			else 
			q_next12 = 4'b0;
		end
			
	else if(down12)
		begin
				if (q12 >= 4'b0) begin				
						q_next12 = q_act12 - 4'sb1;
				end
				else 
					q_next12=4'b0;			
				
		end
		
		else begin
			q_next12 = 4'b0;end
			
	end
	
	else  begin q_next12 = 4'b0;end		

	
end
//Output Logic
assign q12 = q_act12;
 
endmodule
*/
