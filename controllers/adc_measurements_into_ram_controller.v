module adc_measurements_into_ram_controller (
    input       [11: 0] adc_measurements,
    input       RESET,
    input       CLOCK,
    output reg  can_write_ram
);

    reg [14:0] sample_count = 0;
    reg [3:0] clock_cycles = 0;

    always @(posedge CLOCK) begin
        if(adc_measurements) begin
            if(clock_cycles < 4'b1000) clock_cycles = clock_cycles + 1;
            else clock_cycles = 4'b0000;

            if(clock_cycles == 4'b1000) sample_count = sample_count + 1;
            if(sample_count == 15'b100000000000000) can_write_ram = 0;
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