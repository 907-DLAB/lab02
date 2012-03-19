`timescale 1ns / 1ps

module stack(clk, op, in, out, reset, iv, ov);

    input   [15:0] in;
    input   iv, reset, clk, op;
    output reg [15:0] out;
    output reg ov;

    reg [159:0] stack;
    
    // reset
    always @ (posedge reset) begin
        stack = 0;
        $display(stack);
    end
    
    
    
    always @ (negedge clk or op) begin
        
        // ov reset to 0        
        ov = 0;    
        
        
        if (iv) begin // iv
        
            case (op)
            
                0   : begin                     // push
                    $display("push %d", in);
                    stack = { stack[143:0], in };
                end
                
                1   : begin                     // pop
                    ov = 1;
                    out = stack[15:0];
                    $display("pop %d", out);
                    stack = { 0, stack[159:16] };
                end
                
            endcase
        end
   end
   
endmodule
