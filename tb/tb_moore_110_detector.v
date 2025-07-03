
module tb_moore_110_detector;
    reg clk, rst, in_bit;
    wire detected;
    moore_110_detector uut(clk, rst, in_bit, detected);
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin
        rst = 1; in_bit = 0; #10; rst = 0;
        in_bit = 1; #10; in_bit = 1; #10; in_bit = 0; #10;
        in_bit = 1; #10; in_bit = 1; #10; in_bit = 0; #10;
        $finish;
    end
endmodule
