module LeftShiftRegister_tb ();

    logic clk, rst, load, shift_0, shift_1;
    logic [7:0] in, out;

    always #5 clk = ~clk;
    LeftShiftRegister RSR (
        .clk(clk),
        .rst(rst),
        .load(load),
        .shift_0(shift_0),
        .shift_1(shift_1),
        .in(in),
        .val(out)
    );
    initial begin
        clk = 0;
        shift_0 = 0;
        shift_1 = 0;
        $monitor("Time:%5t, Clk:%b, Rst:%b, Shift_0:%b, Shift_1:%b, Load:%b, In:%b, Out:%b", $time,
                 clk, rst, shift_0, shift_1, load, in, out);
        #1;
        rst = 1;
        #1;
        rst  = 0;
        in   = 12;
        load = 1;
        @(negedge clk);
        load = 0;
        #5;
        in = 8;
        #100;
        shift_0 = 1;
        #20;
        shift_0 = 0;
        #20;
        shift_1 = 1;
        #100;
        shift_1 = 0;
        rst = 1;
        #1;
        rst = 0;
        #5;
        $finish;
    end
endmodule
