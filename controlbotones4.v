`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:43:17 04/28/2016 
// Design Name: 
// Module Name:    controlbotones4 
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
module controlbotones4(
input wire clkr,  
input wire levelr, 
output wire tickr
);           
reg FF1;       
reg FF2;       
reg FF3; 
reg FF4; 
     

always @(posedge clkr) 
begin
          
      FF1<=levelr;      //el siguiente valor de FF1 sera elevelr
      FF2<=FF1;   //el siguiente valor de FF2 sera FF1
      FF3<=FF2;   //el siguiente valor de FF3 sera FF2
		FF4<=FF3;
end

assign tickr = FF1 & FF2 & FF3 & FF4 & !levelr;   //outp sera 1 si FF1, FF2, FF3 y FF4 son 1 .

endmodule

