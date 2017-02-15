//alu.v

module alu(op, in0, in1, out, zf);
`include "define.h"

	input [3:0] op;
	input [7:0] in0, in1;
	output [7:0] out;
	output zf;
	reg [7:0] out;
	reg zf;

	always @(*) begin
		case(op)
//synopsys full_case
//synopsys parallel_case
		INC:out <= in0 + 1;
		COMPARE1:
			if(in0>in1) begin
				if(in0-in1==1) begin
					zf <= 0;
				end else begin
					zf <= 1;
				end
			end else if(in0<in1) begin
				if(in1-in0==1) begin
					zf <= 0;
				end else begin
					zf <= 1;
				end
			end else begin
				zf <= 0;
			end
		COMPARE2:
			if(in0>in1) begin
				if(in0-in1==2) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else if(in0<in1) begin
				if(in1-in0==2) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else begin
				zf <= 1;
			end
		COMPARE3:
			if(in0>in1) begin
				if(in0-in1==3) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else if(in0<in1) begin
				if(in1-in0==3) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else begin
				zf <= 1;
			end
		COMPARE4:
			if(in0>in1) begin
				if(in0-in1==4) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else if(in0<in1) begin
				if(in1-in0==4) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else begin
				zf <= 1;
			end
		COMPARE5:
			if(in0>in1) begin
				if(in0-in1==5) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else if(in0<in1) begin
				if(in1-in0==5) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else begin
				zf <= 1;
			end
		COMPARE6:
			if(in0>in1) begin
				if(in0-in1==6) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else if(in0<in1) begin
				if(in1-in0==6) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else begin
				zf <= 1;
			end
		COMPARE7:
			if(in0>in1) begin
				if(in0-in1==7) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else if(in0<in1) begin
				if(in1-in0==7) begin
					zf <= 1;
				end else begin
					zf <= 0;
				end
			end else begin
				zf <= 1;
			end
		LI:out <= in0;
		STORE:out <= in0;
		CHECK:
			if(in1>in0) begin
				zf<=1;
			end else begin
				zf<=0;
			end
		ADD: out <= in0 + in1;
		SUB: out <= in0 - in1;
		NAND: out <= ~(in0 & in1);
		default:
			out <= 0;
		endcase
	end
endmodule

