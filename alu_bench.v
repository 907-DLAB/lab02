`timescale 1ns / 1ps

module alu_bench;

	// Inputs
	reg         CLK, IN_VALID;
	reg  [3:0]  A, B, OP_MODE;  //OP_MODE = operator

	// Outputs
	wire [15:0] OUT;
	wire OUT_VALID;
	
	parameter CYCLE = 10;
	always #(CYCLE/2.0) CLK = ~CLK;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.CLK(CLK),
		.in_valid(IN_VALID),
		.out_valid(OUT_VALID),
		.A(A), 
		.B(B), 
		.op(OP_MODE),
		.out(OUT)
	);

initial 
begin  
	
  //initial
  CLK      = 0;
  IN_VALID = 0;
  OP_MODE  = 0;
  A        = 'bx;
  B        = 'bx;
  
  
  #(1*CYCLE);
  @(negedge CLK);
  IN_VALID = 0;         //false
  A        = 0; 
  B		  = 0;
  OP_MODE  = 0;  
  
  @(negedge CLK);
  IN_VALID = 1'd1;
  A        = 4'd12;		//12
  B		  = 4'd9; 		//9
  OP_MODE  = 4'b0001; 	//+
  
  @(negedge CLK);
  IN_VALID = 1'd1;
  A        = 4'd8;		//8
  B		  = 4'd3;		//3 
  OP_MODE  = 4'b0010; 	//-
  
  @(negedge CLK);
  IN_VALID = 1'd1;
  A        = 4'd7;		//7
  B		  = 4'd5;		//5 
  OP_MODE  = 4'b0100; 	//*
  
  @(negedge CLK);
  IN_VALID = 0;
  A        = 0;
  B		  = 0; 
  OP_MODE  = 0; 
 
end
      
endmodule
