`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:39 04/19/2016 
// Design Name: 
// Module Name:    MUX_data 
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
module MUX_data(
    input wire sel,
    input wire [7:0] data_a,
    input wire [7:0] data_b,
    output reg [7:0] data_out
    );

always @*
begin
	case (sel)
			1'b0: data_out = data_a;
			1'b1: data_out = data_b;
		endcase
end

endmodule
