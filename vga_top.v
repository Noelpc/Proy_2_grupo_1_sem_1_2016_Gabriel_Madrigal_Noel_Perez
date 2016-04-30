`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:17 04/17/2016 
// Design Name: 
// Module Name:    vga_top 
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
module vga_top(
    input wire clk,
	 input wire reset,
	 input wire Sel,
	 input wire [3:0] flag_rd, flag_wr,
	 input wire [7:0] rtc_data_rd, rtc_data_wr,
    output wire hsync,
	 output wire vsync,
    output wire [2:0] RGB_Out
    );

   // signal declaration
   wire [9:0] pixel_x, pixel_y;
   wire video_on, pixel_tick;
   wire [7:0] text_on;
   wire [2:0] text_rgb;
   reg [2:0] rgb_reg, rgb_next;

   //=======================================================
   // instantiation
   //=======================================================
	
	// intantiate debounce module 
	//debounce_circuit debounce_unit (
   //.inp(RESET), 
   //.clk(clk), 
   //.outp(reset)
   //);
	    
	// instantiate frequency divider module
	freq_div div_unit (
    .clk(clk), 
    .reset(reset), 
    .DivCLK(DivCLK)
    );
	
	// instantiate video synchronization unit
	vga_sync sync_unit (
    .clk(DivCLK), 
    .reset(reset), 
    .hsync(hsync), 
    .vsync(vsync), 
    .video_on(video_on), 
    .p_tick(pixel_tick), 
    .pixel_x(pixel_x), 
    .pixel_y(pixel_y)
    );

	// instantiate MUX Flags
	wire [3:0] flag_code;
	wire [8:0] flag_data;
	
	MUX_flags Flags_MUX (
    .sel(Sel), 
    .flag_a(flag_rd), 
    .flag_b(flag_wr), 
    .flag_out(flag_code)
    );

	//instantiate DECO Flags
	DECO_flags Flag_DECO (
    .data_in(flag_code), 
    .data_out(flag_data)
    );

	//instantiate MUX Data
	wire [7:0] data_vga;
	
	MUX_data RTC_MUX_Data (
    .sel(Sel), 
    .data_a(rtc_data_rd), 
    .data_b(rtc_data_wr), 
    .data_out(data_vga)
    );

	// instantiate data interface
	wire [7:0] date_day, date_month, date_year, hour_sec, hour_min, hour_hour, cron_sec, cron_min, cron_hour;
	
	data_int data_interface (
    .clk(clk),												// Señal clk original, 100 MHz 
    .reset(reset), 
    .en(flag_data), 
    .data_in(data_vga), 
    .data_out_date_d(date_day), 
    .data_out_date_m(date_month), 
    .data_out_date_y(date_year), 
    .data_out_hour_sec(hour_sec), 
    .data_out_hour_min(hour_min), 
    .data_out_hour_h(hour_hour), 
    .data_out_cron_sec(cron_sec), 
    .data_out_cron_min(cron_min), 
    .data_out_cron_h(cron_hour)
    );
	
	// instantiate text module
   vga_text tex_unit (
    .CLK(DivCLK), 
    .pix_x(pixel_x), 
    .pix_y(pixel_y),
	 .data_in_date_d(date_day), 
    .data_in_date_m(date_month), 
    .data_in_date_y(date_year), 
    .data_in_hour_sec(hour_sec), 
    .data_in_hour_min(hour_min), 
    .data_in_hour_h(hour_hour), 
    .data_in_cron_sec(cron_sec), 
    .data_in_cron_min(cron_min), 
    .data_in_cron_h(cron_hour),
    .text_on(text_on), 
    .text_rgb(text_rgb)
    );
	 

	//=======================================================
   // FSMD
   //=======================================================
   // FSMD state & data registers
    always @(posedge DivCLK, posedge reset)
       if (reset) rgb_reg <= 0;
		 
       else
          begin
            if (pixel_tick) rgb_reg <= rgb_next;
          end

   //=======================================================
   // rgb multiplexing circuit
   //=======================================================
   always @*
      if (~video_on)
         rgb_next = 3'b000; // blank the edge/retrace
      else
         // display
         if (text_on[0] || text_on[1] || text_on[2] || text_on[3] || text_on[4] || 
					text_on[5] || text_on[6] || text_on[7]) rgb_next = text_rgb;
         else
           rgb_next = 3'b111; // white background
   // output
   assign RGB_Out = rgb_reg;
	
endmodule
