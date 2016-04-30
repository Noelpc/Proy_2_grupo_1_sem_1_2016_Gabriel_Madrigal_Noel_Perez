`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:58:36 04/25/2016 
// Design Name: 
// Module Name:    mux_inicio 
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
module mux_inicio(
    input [7:0] In_data,
    input [7:0] In_dir,
	 output reg [7:0] Out_RTC,
	 input Sel1,
	 input Sel2,
	 input  AD1, RD1, CS1, WR1, AD2, RD2, CS2, WR2,
	output reg AD, RD, CS ,WR
	 
    );
	 always@*
	 begin 
		if(Sel1==1 || Sel2==1) begin
					if(Sel2) begin//Establece contenido
						Out_RTC = In_data;
							AD = AD2;// 
							RD = RD2;//
							CS = CS2;//
							WR = WR2;
						end
					else if(Sel1)begin//Establece datos
						Out_RTC = In_dir;
						AD = AD1;//
						RD = RD1;//
						CS = CS1;//
						WR = WR1;
				end
					else begin
						Out_RTC=1;
						AD = 1;//
						RD = 1;//
						CS = 1;//
						WR = 1;end
		end
		else
			begin 
				Out_RTC=7'b1;
				AD = 1;//
				RD = 1;//
				CS = 1;//
				WR = 1; end
		
	end
	

endmodule
	
	