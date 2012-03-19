`timescale 1ns / 1ps

module stack_bench;

    reg     [3:0] in;
    reg     CLK ,reset, in_valid, method;
    wire    [3:0] out;
    wire    out_valid;
    
    parameter   CYCLE               = 10;
    always      #(CYCLE/2.0) CLK    = ~CLK;

    
	// Instantiate the Unit Under Test (UUT)
    
    stack uut (
        .in(in),
        .out(out),
        .reset(reset),
        .clk(CLK),
        .method(method),
        .in_valid(in_valid),
        .out_valid(out_valid)
    );
    
    always @ (negedge CLK) begin
        if (out_valid) begin
            $display("==========================================");
            $display(out);
            $display("==========================================");
        end
    end
    

    initial
    begin
                
        CLK         = 0;
        reset       = 0;
        in_valid    = 0;
        
        //reset
        #(2*CYCLE);
        @(negedge CLK);        
            reset = 1;            
        @(negedge CLK);        
            reset = 0;   
                
        @(negedge CLK); 
            method = 0;
            in_valid = 1;            
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
            method = 1;
            
        @(negedge CLK);
        @(negedge CLK);            
        @(negedge CLK);
        @(negedge CLK);
        @(negedge CLK);
        @(negedge CLK);            
        @(negedge CLK);          
        @(negedge CLK);
            
        @(negedge CLK); 
        
            method = 0;
            in_valid = 0;
            in = 0;
            
        
        
    end
    

endmodule

