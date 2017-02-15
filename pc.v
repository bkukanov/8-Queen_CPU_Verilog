module pc(clk, rst, we, pc_in, pc_out);
	input clk, rst,we;
	input [6:0] pc_in;
	output [6:0] pc_out;

	reg [6:0] pc_out;

	always @(posedge clk) begin
		if(rst == 1'b1) begin
			pc_out <= 0;
		end else begin
			if(we == 1'b1) begin
				pc_out <= pc_in;
			end else begin
				pc_out <= pc_out+1;
			end
		end
	end
endmodule
