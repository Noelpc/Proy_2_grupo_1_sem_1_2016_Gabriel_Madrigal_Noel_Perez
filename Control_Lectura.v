`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:50 04/10/2016 
// Design Name: 
// Module Name:    Control_Lectura 
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
///////Este módulo controlará el cambio de estados de la máquina de lectura/////
/////////////////////////////////////////////////////////////////////////////////
module Control_Lectura( 
		input wire clkCL,
		input wire resetCL,
		input wire enCL,
		output reg B1
		//output reg B2
		
    );

//Signal Declarations
reg [4:0]q_actCL, q_nextCL;

always@(posedge clkCL,posedge resetCL)
 begin
	if(resetCL) begin
		q_actCL <= 5'b0; 
		end
	else
		q_actCL <= q_nextCL;
end
		
always@*
begin
	if(enCL)
	begin
	if (q_actCL <= 5'b11011) begin
		q_nextCL = q_actCL + 5'b1;
			if(q_actCL <= 5'b01101) 
				begin
					B1 = 1'b0;
				end
			else B1 = 1'b1; 
	end
		else begin  q_nextCL = 5'b0;  end
	end
	else 
		q_nextCL =5'b0;
	
end
/*				
always@*
begin
	if(enCL)
	begin
	if (q_actCL <= 5'b11011) begin
		q_nextCL = q_actCL + 5'b1;
			if(q_actCL <= 5'b01101) 
				begin
					B2 = 1'b0;
				end
			else B2 = 1'b1; 
	end
		else begin  q_nextCL = 5'b0;  end
	end
	else 
		q_nextCL =5'b0;
	
end*/

endmodule
