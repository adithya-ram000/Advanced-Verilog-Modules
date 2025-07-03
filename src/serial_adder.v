
module serial_adder(input clk, input rst, input a, input b, output reg sum, output reg carry);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 0;
            carry <= 0;
        end else begin
            sum <= a ^ b ^ carry;
            carry <= (a & b) | (carry & (a ^ b));
        end
    end
endmodule
