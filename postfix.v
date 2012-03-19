`timescale 1ns / 1ps

module postfix(CLK, OP_MODE, IN, OUT, RESET, IN_VALID, OUT_VALID);

    input   [3:0] IN;
    input   IN_VALID, RESET, CLK, OP_MODE;
    output reg [15:0] OUT;
    output reg OUT_VALID;    
    reg [15:0] A, B, T;    
    reg [159:0] stack;
    
    
    // reset
    always @ (posedge RESET) begin
        stack = 0;
        OUT_VALID = 0;
        $display(stack);
    end
    
    // reset
    always @ (negedge IN_VALID) begin
        if (OUT_VALID != 1) begin
            OUT_VALID = 1;
            @ (negedge CLK) begin
                OUT_VALID = 0;
            end
        end
    end    
    
    always @ (negedge CLK) begin
        if (IN_VALID) begin
            if (OP_MODE) begin  
                A = stack[31:16];
                B = stack[15:0];                
                case (IN)
				    4'b0001:
				    begin
					    T = A + B;
				    end
				    4'b0010:
				    begin
					    T = A - B;
				    end
				    4'b0100:
				    begin
					    T = A * B;
				    end
				endcase				    
                stack = { 0, stack[159:32], T };
                OUT = T;                
            end else begin            
                stack = { stack[143:0], 12'b000000000000,  IN };
            end
        end
    end
    
   
endmodule
