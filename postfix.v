`timescale 1ns / 1ps

module postfix(CLK, OP_MODE, IN, OUT, RESET, IN_VALID, OUT_VALID, st_ov);

    input   [3:0] IN;
    input   IN_VALID, RESET, CLK, OP_MODE;
    output reg [15:0] OUT;
    output OUT_VALID;
    
    // stack
    reg [15:0] st_in;
    reg st_iv, st_op;
    output st_ov;
    wire [15:0] st_out;
    
    stack st (
        .in(st_in),
        .out(st_out),
        .reset(RESET),
        .clk(CLK),
        .op(st_op),
        .iv(st_iv),
        .ov(st_ov)
    );
    
    
    // reset
    always @ (posedge RESET) begin 
        $display("reset");
    end
    
    always @ (st_ov) begin 
        $display("stack out!");
        $display(st_out);
    end
    
    always @ (negedge CLK) begin 
    
    
        st_iv <= IN_VALID;
    
        if (IN_VALID) begin
            
            if (OP_MODE) begin
                $display("OP");
                st_op <= 1;
                
                
            end else begin
            
                st_in = { 0, IN };
                st_op <= 0;
                
            end
            
        end 
    
           
    
    end
   
endmodule
