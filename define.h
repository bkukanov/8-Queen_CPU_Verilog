//define.h

parameter	INC = 4'b0000;
parameter	JMP = 4'b0001;
parameter	JNZ = 4'b0010;			//Jump when there's a valid flag
parameter	LI = 4'b0011;			//Immediately Load
parameter	STORE = 4'b0100;		//from register to memory
parameter	COMPARE1 = 4'b0101;
parameter	COMPARE2 = 4'b0110;
parameter	COMPARE3 = 4'b0111;
parameter	COMPARE4 = 4'b1000;
parameter	COMPARE5 = 4'b1001;
parameter	COMPARE6 = 4'b1010;
parameter	COMPARE7 = 4'b1011;
parameter	CHECK = 4'b1100;
parameter	ADD = 4'b1101;
parameter	SUB = 4'b1110;
parameter	NAND = 4'b1111;
