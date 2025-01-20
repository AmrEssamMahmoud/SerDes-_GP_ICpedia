module sampler (
    input wire Reset,
    input wire data_clock,
    input wire phase_clock,
    input wire Serial,
    output wire Dn_1,
    output wire Dn,
    output wire Pn
);

    // Internal signals
    wire data_clock_inv, phase_clock_inv;
    reg data_sample1, data_sample2;
    reg phase_sample1, phase_sample2;
    reg data_flag, phase_flag;
    
    assign data_clock_inv = ~data_clock;
    assign phase_clock_inv = ~phase_clock;

    assign Dn_1 = data_flag ? data_sample1 : data_sample2;
    assign Dn = data_flag ? data_sample2 : data_sample1;
    assign Pn = phase_flag ? phase_sample1 : phase_sample2;

    // Data sampling
    always @(posedge data_clock or negedge Reset) begin
        if (!Reset) begin
            data_sample1 <= 0;
            data_flag <= 0;
        end else begin
            data_sample1 <= Serial;
            data_flag <= 0;
        end
    end

    always @(posedge data_clock_inv or negedge Reset) begin
        if (!Reset) begin
            data_sample2 <= 0;
            data_flag <= 0;
        end else begin
            data_sample2 <= Serial;
            data_flag <= 1;
        end
    end

    // Phase sampling
    always @(posedge phase_clock or negedge Reset) begin
        if (!Reset) begin
            phase_sample1 <= 0;
            phase_flag <= 0;
        end else begin
            phase_sample1 <= Serial;
            phase_flag <= 0;
        end
    end

    always @(posedge phase_clock_inv or negedge Reset) begin
        if (!Reset) begin
            phase_sample2 <= 0;
            phase_flag <= 0;
        end else begin
            phase_sample2 <= Serial;
            phase_flag <= 1;
        end
    end

endmodule
