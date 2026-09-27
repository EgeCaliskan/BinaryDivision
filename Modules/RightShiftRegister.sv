module RightShiftRegister (
    input logic clk,
    input logic rst,
    input logic [7:0] in,
    input logic load,
    input logic shift,
    output logic [7:0] val
);

    logic [7:0] register, register_next;
    always_ff @(posedge clk, posedge rst) begin
        if (rst) register <= 0;
        else register <= register_next;

    end

    always_comb begin
        if (load) register_next = in;
        else if (shift) register_next = register >> 1;
        else register_next = register;
    end

    assign val = register;
endmodule
