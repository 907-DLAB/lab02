`timescale 1ns / 1ps

module alu( CLK, reset, in_valid, A, B, op, out );
   
	input CLK, reset, in_valid;
   input [3:0] A, B;
   input [3:0] op;
   output reg [15:0] out;
	
	always @ (posedge reset)
	begin
		out = 0;
	end
	
	always @ ( in_valid or op )
	begin
		if(in_valid)
		begin
			case(op)
				4'b0001:
				begin
					out = A+B;
				end
				4'b0010:
				begin
					out = A-B;
				end
				4'b0100:
				begin
					out = A*B;
				end
			endcase
		end
	end
endmodule
