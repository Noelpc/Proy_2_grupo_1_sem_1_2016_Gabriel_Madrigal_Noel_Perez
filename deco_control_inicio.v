`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:08:32 04/26/2016 
// Design Name: 
// Module Name:    deco_control_inicio 
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
module deco_control_inicio(

input [5:0] count,
//input reset,
//input EnR, 
output CLK1,
output  CLK2);
reg CLK1ac;
reg CLK2ac;

always@*
begin
	case(count)
	////Aqui se ejecuta el comando de transferencia///
			7'd0: begin
						CLK1ac <=1'b1;
						CLK2ac <=1'b0;
						end
					
			7'd11:
				begin
						CLK1ac <=1'b0;
						CLK2ac <=1'b0;
						end
					
						
			7'd23:
				begin	
						CLK1ac <=1'b0;
						CLK2ac <=1'b1;
						
						end
		
						
			7'd35:
				begin
						CLK1ac <=1'b0;
						CLK2ac <=1'b0;
						end
			
			default : begin
					CLK1ac <=CLK1ac;
					CLK2ac <= CLK2ac;
					end
					
		endcase
	
end

assign	CLK1 = CLK1ac;
assign	CLK2 = CLK2ac;
		
endmodule
