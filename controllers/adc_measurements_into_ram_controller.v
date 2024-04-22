module adc_measurements_into_ram_controller (
    input       [11: 0] adc_measurements,
    input       received_measurement,
    input       fft_finished,
    input       RESET,
    input       CLOCK,
    output reg  can_write_ram
);

    reg [14:0] sample_count = 0;
    
    always @(posedge CLOCK) begin
        if(received_measurement == 1) begin
            // in order for the 2^15 Fast Fourier Ttransform to work we need 2^15 data points => MAX {sample_count} = 15b'100000...0 
            if(sample_count == 15'b100000000000000) can_write_ram = 0;
            else can_write_ram = 1;
        end
    end

    wire write_enable;
    assign write_enable = can_write_ram;

  ram RAM_1 (
        .address(sample_count),
        .clock(CLOCK),
        .data(adc_measurements),
        .wren(write_enable),
        .q(q_out)
    );
endmodule