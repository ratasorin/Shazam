`include "controllers/adc_measurements_into_ram_controller.v"

module Shazam(input RESET,
              input CLOCK,
              input [4:0] channel,
              output can_write_ram);
    
    wire received_measurement;
    wire [11: 0] adc_measurements;
    
    wire pll_clk_10MHz;
    wire pll_locked;
    
    clk_pll PLL (
    .areset(RESET),
    .inclk0(CLOCK),
    .c0(pll_clk_10MHz),
    .locked(pll_locked)
    );
    
    adc_core ADC_CORE_1 (
    .adc_pll_clock_clk(pll_clk_10MHz),
    .adc_pll_locked_export(pll_locked),
    .clock_clk(CLOCK),
    .command_valid(1),
    .command_startofpacket(0),
    .command_endofpacket(0),
    .command_channel(channel),
    .command_ready(),
    .reset_sink_reset_n(~RESET),
    .response_valid(received_measurement),
    .response_startofpacket(),
    .response_endofpacket(),
    .response_data(adc_measurements)
    );
    
    adc_measurements_into_ram_controller ADC_INTO_RAM (
    .adc_measurements(adc_measurements),
    .received_measurement(received_measurement),
    .RESET(RESET),
    .CLOCK(CLOCK),
    .can_write_ram(can_write_ram)
    );
    
    
endmodule
