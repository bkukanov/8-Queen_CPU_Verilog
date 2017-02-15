// decoder

module decoder(op, zf, alu_op, src0, src1, dst, sel1, sel2, reg_we, pc_we, mem_we, data, pc_in);
`include "define.h"
	input [15:0] op;
	input zf;
	output [3:0]alu_op, src0, src1, dst;
	output sel1, sel2, reg_we, pc_we, mem_we;
	output [7:0] data;
	output [6:0] pc_in;


	reg [3:0]alu_op, src0, src1, dst;
	reg sel1, sel2, reg_we, pc_we, mem_we;
	reg [7:0] data;
	reg [6:0] pc_in;

	always @(*) begin
		case (op[15:12])
//synopsys full_case
//synopsys parallel_case
		ADD, SUB, NAND: begin
			alu_op <= op[15:12];
			src0 <= op[11:8];
			src1 <= op[7:4];
			dst <= op[3:0];
			sel1 <= 1;
			sel2 <= 0;
			reg_we <= 1;
			pc_we <= 0;
			mem_we <= 0;
		end
		INC : begin
			alu_op <= op[15:12];
			src0 <= op[7:4];
			dst <= op[3:0];
			sel1 <= 1;
			sel2 <= 0;
			reg_we <= 1;
			pc_we <= 0;
			mem_we <= 0;
		end
		/*COMPARE,*/ COMPARE1, COMPARE2, COMPARE3, COMPARE4, COMPARE5,COMPARE6, COMPARE7 : begin
			alu_op <= op[15:12];
			src0 <= op[7:4];
			src1 <= op[3:0];
			sel1 <= 1;
			reg_we <= 0;
			pc_we <= 0;
			mem_we <= 0;
		end
		JMP : begin
			pc_we <= 1;
			pc_in <= op[6:0];
		end
		JNZ : begin
			pc_we <= zf;
			pc_in <= op[6:0];
		end
		LI : begin
			sel1 <= 0;
			sel2 <= 0;
			alu_op <= op[15:12];
			data <= op[11:4];
			dst <= op[3:0];
			reg_we <= 1;
			pc_we <= 0;
			mem_we <= 0;
		end
		/*LOAD : begin
			src1 <= op[7:4];
			dst <= op[3:0];
			sel2 <= 1;
			reg_we <= 1;
			pc_we <= 0;
			mem_we <= 0;
		end*/
		STORE : begin
			alu_op <= op[15:12];
			src0 <= op[11:8];
			src1 <= op[7:4];
			dst <= op[3:0];
			sel1 <= 1;
			reg_we <= 0;
			pc_we <= 0;
			mem_we <= 1;
		end
		CHECK : begin
			alu_op <= op[15:12];
			data <= op[11:4];
			src1 <= op[3:0];
			sel1 <= 0;
			reg_we <= 0;
			pc_we <= 0;
			mem_we <= 0;
		end
		default: begin
			reg_we <= 0;
			pc_we <= 0;
			mem_we <= 1;
		end
		endcase
	end
endmodule

