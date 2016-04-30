`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:12 04/26/2016 
// Design Name: 
// Module Name:    Buffer 
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
module Buffer (IN, clk, inp, outp, bidir);


input   IN;//selector
input   clk;
input   [7:0] inp;//entrada_datos, dato q quiero enviar
output  [7:0] outp;//salida, dato q se recibe de rtc
inout   [7:0] bidir;//IN_OUT_RTC

reg     [7:0] a;
reg     [7:0] b;

assign bidir = IN ? a : 8'bZ ;
assign outp  = b;

// Always Construct

always @ (posedge clk)
begin
    b <= bidir;
    a <= inp;
end

endmodule
