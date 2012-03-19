`timescale 1ns / 1ps

module postfix ( CLK, RESET, IN_VALID, OP_MODE, IN, OUT_VALID, OUT );
	
	input				CLK, RESET, IN_VALID, OP_MODE;
	input [3:0]		IN;
	output reg			OUT_VALID;
	output reg [15:0]	OUT;
	
	reg [159:0] stack;
	reg [15:0]	tmpA, tmpB, tmp;
	
	always @ ( posedge RESET ) begin
		OUT_VALID	  	= 0;
		OUT			   = 0;
		stack				= 0;
	end

	always @ (negedge CLK) begin
	
		if (IN_VALID) begin
			$display(" ");
			$display("this input is %d", IN);
			if (~OP_MODE) begin
				stack = { stack[143:0], 12'b0, IN };
				$display("push IN=%d", IN);
			end
			else begin
				tmpA = stack[31:16];
				tmpB = stack[15:0];
					
				case(IN)
					4'b0001: begin
						tmp = tmpA+tmpB;
					end
					
					4'b0010: begin
						tmp = tmpA-tmpB;
					end
					
					4'b0100: begin
						tmp = tmpA*tmpB;
					end
				endcase
				
            stack = { 0, stack[159:32], tmp };
				$display("pop tmpA=%d, tmpB=%d, IN=%d ,tmp=%d", tmpA, tmpB, IN, tmp);
			end
		end
		
		if (OUT_VALID) begin
			OUT_VALID = 0;
		end
	end
	
	always @ (negedge IN_VALID) begin
		if (~OUT_VALID) begin
			OUT_VALID = 1;
			OUT = stack[15:0];
		end
	end
	
endmodule
