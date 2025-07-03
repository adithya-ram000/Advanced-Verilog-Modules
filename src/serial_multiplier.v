
module serial_multiplier(input clk, input rst, input start, input [3:0] a, input [3:0] b, output reg [7:0] product);
    reg [3:0] count;
    reg [7:0] temp_a, temp_b;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            product <= 0;
            temp_a <= 0;
            temp_b <= 0;
            count <= 0;
        end else if (start) begin
            temp_a <= {4'b0, a};
            temp_b <= {4'b0, b};
            product <= 0;
            count <= 4;
        end else if (count > 0) begin
            if (temp_b[0])
                product <= product + temp_a;
            temp_a <= temp_a << 1;
            temp_b <= temp_b >> 1;
            count <= count - 1;
        end
    end
endmodule
