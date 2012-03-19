`timescale 1ns / 1ps

module pattern;
	// Inputs
	reg         CLK, RESET, IN_VALID, OP_MODE;
	reg  [3:0]  IN;

	// Outputs
	wire        OUT_VALID, st_ov;
	wire [15:0] OUT;
	reg  [15:0] YOUR_ANSWER;
	
	integer          i, j, error;    
  integer          flag;

	parameter        CYCLE        = 10;
	always #(CYCLE/2.0) CLK = ~CLK;


	// Instantiate the Unit Under Test (UUT)
	postfix uut (
		 .CLK(CLK),
       .RESET(RESET),
       .IN_VALID(IN_VALID),
       .OP_MODE(OP_MODE),
       .IN(IN),
       .OUT_VALID(OUT_VALID),
       .OUT(OUT),
       .st_ov(st_ov)
	);

initial 
begin  
	
  //initial
  CLK      = 0;         
  RESET    = 0;    
  IN_VALID = 0; 
  OP_MODE  = 0;
  IN       = 'bx;    
  i        = 0;
  j        = 0;
  error    = 0;
  flag     = 0;
  
  //reset
  #(2*CYCLE);     
  @(negedge CLK);
  RESET = 1;
  @(negedge CLK);
  RESET = 0;
  
  
  #(1*CYCLE);
  @(negedge CLK);
  IN_VALID = 0; 
  IN       = 0; 
  OP_MODE  = 0;  
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd12; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd9; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd6; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'b0100; 
  OP_MODE  = 1'd1; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'b0001; 
  OP_MODE  = 1'd1; 
  
  @(negedge CLK);
  IN_VALID = 0; 
  IN       = 0; 
  OP_MODE  = 0;  
  
  @(negedge CLK);
  @(negedge CLK);
  
  
  @(negedge CLK);
  @(negedge CLK);
  @(negedge CLK);
  @(negedge CLK);
  
  if(flag)begin
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd15; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd8; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'b0100; 
  OP_MODE  = 1; 
  end
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd11; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'b0001; 
  OP_MODE  = 1; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd7; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd4; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'b0100; 
  OP_MODE  = 1; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'b0010; 
  OP_MODE  = 1; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd13; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd12; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd11; 
  OP_MODE  = 0; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'b0100; 
  OP_MODE  = 1; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'b0100; 
  OP_MODE  = 1; 
  
  @(negedge CLK);
  IN_VALID = 1'd1; 
  IN       = 4'd0001; 
  OP_MODE  = 1; 
  
  @(negedge CLK);
  IN_VALID = 0; 
  IN       = 0; 
  OP_MODE  = 0;  
  
  @(negedge CLK);
  @(negedge CLK);
end

//---------------------------------------------------------------------
// CHECK CORRECT PATTERN WITH DESIGN OUTPUT PATTERN           
//---------------------------------------------------------------------
always@(negedge CLK)
begin

  if(OUT_VALID && (i == 0))
  begin
    i = i+1;
    YOUR_ANSWER    = OUT[15:0];
    if(YOUR_ANSWER != 16'd66) error = error+1;
    @(negedge CLK);
    @(negedge CLK);
    flag = 1;
    
  end
  
  if(OUT_VALID && flag)
  begin
    YOUR_ANSWER    = OUT[15:0];
    if(YOUR_ANSWER != 16'd1819) error = error+1;
    @(negedge CLK);
    @(negedge CLK);
    i = i+1;
  end
	
	
	
  
  if(i == 2)begin
    if(error==0)begin
      $display ("--------------------------------------------------------------------");
      $display ("                             PASS!!!                                ");
      $display ("                        YOUR_ANSER is right                         ");
      $display ("--------------------------------------------------------------------");
      $display ("");
      @(posedge CLK);    
      @(posedge CLK);    
      $finish; 	
    end
    else begin
      $display ("--------------------------------------------------------------------");
      $display ("                             FAIL!!!                                ");
      $display ("                        YOUR_ANSER is wrong                         ");
      $display ("--------------------------------------------------------------------");
      $display ("");
      @(posedge CLK);    
      @(posedge CLK);    
      $finish; 	
    end
  end
end





endmodule

