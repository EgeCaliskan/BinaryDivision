module RightShiftRegister_tb ();

    logic clk, rst, load, shift;
    logic [7:0] in, out;

    always #5 clk = ~clk;
    RightShiftRegister RSR (
        .clk(clk),
        .rst(rst),
        .load(load),
        .shift(shift),
        .in(in),
        .val(out)
    );
    initial begin
        clk = 0;
        $monitor("Time:%t, Clk:%b, Rst:%b, Shift:%b, Load:%b, In:%b, Out:%b", $time, clk, rst,
                 shift, load, in, out);
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
        shift = 1;
        #20;
        shift = 0;
        #100;
        rst = 1;
        #1;
        rst = 0;
        #5;
        $finish;
    end
endmodule
