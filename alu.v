`timescale 1ns / 1ps

module alu( CLK, in_valid, out_valid, A, B, op, out );
   
    input CLK, in_valid;
    input [3:0] A, B;
    input [3:0] op;
    output reg [15:0] out;
    output reg out_valid;
	
	
	always @ ( in_valid or op )
	begin
		out_valid = 0;
	    
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
			out_valid = 1;
		end
	end
endmodule
