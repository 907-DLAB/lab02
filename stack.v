`timescale 1ns / 1ps

module stack(clk, method, in, out, reset, in_valid, out_valid);

    input   [15:0] in;
    input   in_valid, reset, clk, method;
    output reg [15:0] out;
    output reg out_valid;

    reg [159:0] stack;
    
    // reset
    always @ (posedge reset) begin
        stack = 0;
        $display(stack);
    end
    
    
    
    always @ (negedge clk or method) begin
        
        // out_valid reset to 0        
        out_valid = 0;    
        
        
        if (in_valid) begin // in_valid
        
            case (method)
            
                0   : begin                     // push
                    $display("push %d", in);
                    stack = { stack[143:0], in };
                end
                
                1   : begin                     // pop
                    out_valid = 1;
                    out = stack[15:0];
                    $display("pop %d", out);
                    stack = { 0, stack[159:16] };
                end
                
            endcase
        end
   end
   
endmodule
