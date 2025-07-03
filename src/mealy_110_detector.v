
module mealy_110_detector(input clk, input rst, input in_bit, output reg detected);
    reg [1:0] state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
            detected <= 0;
        end else begin
            case (state)
                S0: begin
                    state <= in_bit ? S1 : S0;
                    detected <= 0;
                end
                S1: begin
                    state <= in_bit ? S1 : S2;
                    detected <= 0;
                end
                S2: begin
                    state <= in_bit ? S1 : S0;
                    detected <= ~in_bit;
                end
            endcase
        end
    end
endmodule
