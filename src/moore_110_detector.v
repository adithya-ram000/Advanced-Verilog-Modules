
module moore_110_detector(input clk, input rst, input in_bit, output reg detected);
    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            detected <= 0;
        end else begin
            case (state)
                S0: state <= in_bit ? S1 : S0;
                S1: state <= in_bit ? S1 : S2;
                S2: state <= in_bit ? S3 : S0;
                S3: state <= in_bit ? S1 : S2;
            endcase
            detected <= (state == S3);
        end
    end
endmodule
