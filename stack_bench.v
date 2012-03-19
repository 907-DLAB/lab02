`timescale 1ns / 1ps

module stack_bench;

    reg     [15:0] in;
    reg     CLK ,reset, iv, op;
    wire    [15:0] out;
    wire    ov;
    
    parameter   CYCLE               = 10;
    always      #(CYCLE/2.0) CLK    = ~CLK;

    
	// Instantiate the Unit Under Test (UUT)
    
    stack uut (
        .in(in),
        .out(out),
        .reset(reset),
        .clk(CLK),
        .op(op),
        .iv(iv),
        .ov(ov)
    );
    
    always @ (negedge CLK) begin
        if (ov) begin
            $display("==========================================");
            $display(out);
            $display("==========================================");
        end
    end
    

    initial
    begin
                
        CLK         = 0;
        reset       = 0;
        iv    = 0;
        
        //reset
        #(2*CYCLE);
        @(negedge CLK);        
            reset = 1;            
        @(negedge CLK);        
            reset = 0;   
                
        @(negedge CLK); 
            op = 0;
            iv = 1;            
            in = 1;       
            
        @(negedge CLK);               
            in = 0;            
        @(negedge CLK); 
            in = 9;  
        @(negedge CLK);               
            in = 2;            
        @(negedge CLK); 
            in = 1;  
        @(negedge CLK);               
            in = 7;            
        @(negedge CLK); 
            in = 3;  
        @(negedge CLK);               
            in = 2;            
        @(negedge CLK); 
            in = 2;
            
        @(negedge CLK); 
            op = 1;
            
        @(negedge CLK);
        @(negedge CLK);            
        @(negedge CLK);
        @(negedge CLK);
        @(negedge CLK);
        @(negedge CLK);            
        @(negedge CLK);          
        @(negedge CLK);
            
        @(negedge CLK); 
        
            op = 0;
            iv = 0;
            in = 0;
            
        
        
    end
    

endmodule

