// N Queen.v

module queen(pc, op);
`include "define.h"

	input [6:0] pc;
	output [15:0] op;
	reg [15:0] op;

	always @(pc)begin
		case(pc)
//synopsys full_case
//synopsys parallel_case

		0: begin
			op[15:12] <= LI;
			op[11:4] <= 0;		//$B$O$8$a$O8D?t$OEvA3(B0$B8D(B
			op[3:0] <= 4'b1110;		//$B2r$N8D?t$r?t$($k>l=j(B($B%"%I%l%9(B)$B$,%l%8%9%?$K$*$1$k(B4'b1110
		end
		1: begin
			op[15:12] <= LI;
			op[11:4] <= 10;		//$B2r$N8D?t$rF~$l$k@h$N!$%a%b%j$N%"%I%l%9$r(B10=4'b1010$B$H$7$?(B
			op[3:0] <= 4'b1100;		//$B$=$N%a%b%j$N%"%I%l%9$NCM(B10$B$r%l%8%9%?$N%"%I%l%9(B4'b1100$B$K3JG<$7$F$*$/(B
		end

///////////////////////////////////////////////////////////////////////////////////////////////////////
/*1$B9TL\$K(BQueen$B$rCV$/9TDx$,$3$3$+$i(B*/
		2: begin
			op[15:12] <= LI;
			op[11:4] <= 0;			//$BCM(B0$B$K=i4|2=$7$F!$(B
			op[3:0] <= 4'b0001;		//register No.0001 = 1$B$KF~$l$k(B
		end
		3: begin
			op[15:12] <= INC;		//the register No.0001 = 1$B$KF~$C$F$$$kCM$r(B1$BB-$7$F!$85$N%"%I%l%9$KCM$rLa$9(B
			op[7:4] <= 4'b0001;		//$B%$%s%/%j%a%s%H$7$?$$CM(B
			op[3:0] <= 4'b0001;		//$B%$%s%/%j%a%s%H8e$K$=$NCM$rF~$l$k%l%8%9%?$N%"%I%l%9(B
		end
///////////////////////////////////////////////////////////////////////////////////////////////////////

/*CHECK if you cannot place a queen in the first row anymore...*/
		4: begin	//1$B9TL\$N(BQueen$B$N0LCV$,(B8$B$rD6$($?$i(B116$B$KHt$V(B
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0001;
		end
		5: begin
			op[15:12] <= JNZ;
			op[6:0] <= 100;			//$B$b$7(B8$B$rD6$($F$?$i!$(BQueen$B$OHW$N30$J$N$G!$C5:w=*N;$G(Bpc=116$B$X(B
		end
/////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////
/*$B$3$l$h$j2<$O(B2$B9TL\$K(BQueen$B$rCV$/:n6H$G$9(B*/
		6: begin		//Queen$B$N0LCV$r=i4|2=$9$k(B
			op[15:12] <= LI;
			op[11:4] <= 0;			//insert 0
			op[3:0] <= 4'b0010;		//into the register No.0010 = 2
		end
		7: begin		//Queen$B$N0LCV$r(B1$B$D$R$@$j$KF0$+$9(B
			op[15:12] <= INC;
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0010;		//Plus 1 to the number in the register No.0010
		end
		8: begin		//Queen$B$N0LCV$,HW$N30$K=P$?$i!$<!$N(BJNZ$B$G(B1$B9TA0$N(BQueen$B$NA`:n$KLa$k(B
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0010;
		end
		9: begin
			op[15:12] <= JNZ;
			op[6:0] <= 3;
		end
		10: begin	//1$B9TL\$N(BQueen$B$K$h$jCV$1$J$/$J$C$?0LCV$K(B2$B9TL\$N(BQueen$B$,=E$J$C$F$$$k$+H=CG(B
			op[15:12] <= COMPARE1;
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0010;
		end
		11: begin	//$BMh$F$$$J$1$l$P(B2$BCJL\$N(BQueen$B$OCV$1$F(B3$BCJL\$K0\F0(B
			op[15:12] <= JNZ;		//if there's a flag, jump to the next Row No.3!!
			op[6:0] <= 13;
		end
		12: begin
			op[15:12] <= JMP;
			op[6:0] <= 7;		//pc=7$B$KLa$k(B
		end
/*2$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$^$G(B*/

/*3$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$+$i(B*/
		13: begin
			op[15:12] <= LI;
			op[11:4] <= 0;			//insert 0
			op[3:0] <= 4'b0011;		//into the register No.0011 = 3
		end
		14: begin
			op[15:12] <= INC;
			op[7:4] <= 4'b0011;
			op[3:0] <= 4'b0011;
		end
		15: begin
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0011;
		end
		16: begin
			op[15:12] <= JNZ;
			op[6:0] <= 7;
		end
		17: begin		//1$B9TL\$N(BQueen$B$K$h$jCV$1$J$/$J$C$?0LCV$K(B3$B9TL\$N(BQueen$B$,Mh$F$$$k$+H=CG(B
			op[15:12] <= COMPARE2;
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0011;
		end
		18: begin
			op[15:12] <= JNZ;
			op[6:0] <= 14;
		end
		19: begin		//2$B9TL\$N(BQueen$B$K$h$jCV$1$J$/$J$C$?0LCV$K(B3$B9TL\$N(BQueen$B$,Mh$F$$$k$+H=CG(B
			op[15:12] <= COMPARE1;
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0011;
		end
		20: begin
			op[15:12] <= JNZ;
			op[6:0] <= 22;		//22$B$K%8%c%s%W$7$F!$(B4$BCJL\$N(BQueen$B$rG[CV$9$k:n6H$K9T$/(B
		end
		21: begin
			op[15:12] <= JMP;
			op[6:0] <=14;		//14$B$KLa$k(B
		end
/*3$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$^$G(B*/

/*4$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$+$i(B*/
		22: begin
			op[15:12] <= LI;
			op[11:4] <= 0;			//insert 0
			op[3:0] <= 4'b0100;		//into the register No.0100 = 4
		end
		23: begin
			op[15:12] <= INC;
			op[7:4] <= 4'b0100;
			op[3:0] <= 4'b0100;
		end
		24: begin
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0100;
		end
		25: begin
			op[15:12] <= JNZ;
			op[6:0] <= 14;
		end
		26: begin
			op[15:12] <= COMPARE3;		//1$B9TL\$N(BQueen$B$K$h$jCV$1$J$/$J$C$?0LCV$K(B4$B9TL\$N(BQueen$B$,Mh$F$$$k$+H=CG(B
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0100;
		end
		27: begin
			op[15:12] <= JNZ;			//$BMh$F$?$i(B23$B$KLa$j!$(B4$B9TL\$N(BQueen$B$N0LCV$r$R$@$j$K(B1$B8D$:$i$9(B
			op[6:0] <= 23;
		end
		28: begin
			op[15:12] <= COMPARE2;		//2$B9TL\$N(BQueen$B$K$h$jCV$1$J$/$J$C$?0LCV$K(B4$B9TL\$N(BQueen$B$,Mh$F$$$k$+H=CG(B
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0100;
		end
		29: begin
			op[15:12] <= JNZ;			//23$B$KLa$k(B
			op[6:0] <= 23;
		end
		30: begin
			op[15:12] <= COMPARE1;		//3$B9TL\$N(BQueen$B$K$h$jCV$1$J$/$J$C$?0LCV$K(B4$B9TL\$N(BQueen$B$,Mh$F$$$k$+H=CG(B
			op[7:4] <= 4'b0011;
			op[3:0] <= 4'b0100;
		end
		31: begin
			op[15:12] <= JNZ;			//$BL5;vCV$1$F$$$?$i(B33$B$K0\F0$7!$(B5$B9TL\$N(BQueen$B$NG[CV:n6H$X(B
			op[6:0] <= 33;
		end
		32: begin
			op[15:12] <= JMP;
			op[6:0] <=23;
		end
/*4$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$^$G(B*/

/*5$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$+$i(B*/
		33: begin
			op[15:12] <= LI;
			op[11:4] <= 0;			//insert 0
			op[3:0] <= 4'b0101;		//into the register No.0101 = 5
		end
		34: begin
			op[15:12] <= INC;
			op[7:4] <= 4'b0101;
			op[3:0] <= 4'b0101;
		end
		35: begin
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0101;
		end
		36: begin
			op[15:12] <= JNZ;
			op[6:0] <= 23;
		end
		37: begin
			op[15:12] <= COMPARE4;
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0101;
		end
		38: begin
			op[15:12] <= JNZ;
			op[6:0] <= 34;
		end
		39: begin
			op[15:12] <= COMPARE3;
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0101;
		end
		40: begin
			op[15:12] <= JNZ;
			op[6:0] <= 34;
		end
		41: begin
			op[15:12] <= COMPARE2;
			op[7:4] <= 4'b0011;
			op[3:0] <= 4'b0101;
		end
		42: begin
			op[15:12] <= JNZ;
			op[6:0] <= 34;
		end
		43: begin
			op[15:12] <= COMPARE1;
			op[7:4] <= 4'b0100;
			op[3:0] <= 4'b0101;
		end
		44: begin
			op[15:12] <= JNZ;
			op[6:0] <= 46;
		end
		45: begin
			op[15:12] <= JMP;
			op[6:0] <=34;
		end
/*5$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$^$G(B*/

/*6$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$+$i(B*/
		46: begin
			op[15:12] <= LI;
			op[11:4] <= 0;			//insert 0
			op[3:0] <= 4'b0110;		//into the register No.0101 =6 
		end
		47: begin
			op[15:12] <= INC;
			op[7:4] <= 4'b0110;
			op[3:0] <= 4'b0110;
		end
		48: begin
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0110;
		end
		49: begin
			op[15:12] <= JNZ;
			op[6:0] <= 34;
		end
		50: begin
			op[15:12] <= COMPARE5;
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0110;
		end
		51: begin
			op[15:12] <= JNZ;
			op[6:0] <= 47;
		end
		52: begin
			op[15:12] <= COMPARE4;
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0110;
		end
		53: begin
			op[15:12] <= JNZ;
			op[6:0] <= 47;
		end
		54: begin
			op[15:12] <= COMPARE3;
			op[7:4] <= 4'b0011;
			op[3:0] <= 4'b0110;
		end
		55: begin
			op[15:12] <= JNZ;
			op[6:0] <= 47;
		end
		56: begin
			op[15:12] <= COMPARE2;
			op[7:4] <= 4'b0100;
			op[3:0] <= 4'b0110;
		end
		57: begin
			op[15:12] <= JNZ;
			op[6:0] <= 47;
		end
		58: begin
			op[15:12] <= COMPARE1;
			op[7:4] <= 4'b0101;
			op[3:0] <= 4'b0110;
		end
		59: begin
			op[15:12] <= JNZ;
			op[6:0] <= 61;
		end
		60: begin
			op[15:12] <= JMP;
			op[6:0] <= 47;
		end
/*6$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$^$G(B*/

/*7$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$+$i(B*/
		61: begin
			op[15:12] <= LI;
			op[11:4] <= 0;			//insert 0
			op[3:0] <= 4'b0111;		//into the register No.0101 = 7
		end
		62: begin
			op[15:12] <= INC;
			op[7:4] <= 4'b0111;
			op[3:0] <= 4'b0111;
		end
		63: begin
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0111;
		end
		64: begin
			op[15:12] <= JNZ;
			op[6:0] <= 47;
		end
		65: begin
			op[15:12] <= COMPARE6;
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0111;
		end
		66: begin
			op[15:12] <= JNZ;
			op[6:0] <= 62;
		end
		67: begin
			op[15:12] <= COMPARE5;
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0111;
		end
		68: begin
			op[15:12] <= JNZ;
			op[6:0] <= 62;
		end
		69: begin
			op[15:12] <= COMPARE4;
			op[7:4] <= 4'b0011;
			op[3:0] <= 4'b0111;
		end
		70: begin
			op[15:12] <= JNZ;
			op[6:0] <= 62;
		end
		71: begin
			op[15:12] <= COMPARE3;
			op[7:4] <= 4'b0100;
			op[3:0] <= 4'b0111;
		end
		72: begin
			op[15:12] <= JNZ;
			op[6:0] <= 62;
		end
		73: begin
			op[15:12] <= COMPARE2;
			op[7:4] <= 4'b0101;
			op[3:0] <= 4'b0111;
		end
		74: begin
			op[15:12] <= JNZ;
			op[6:0] <= 62;
		end
		75: begin
			op[15:12] <= COMPARE1;
			op[7:4] <= 4'b0110;
			op[3:0] <= 4'b0111;
		end
		76: begin
			op[15:12] <= JNZ;
			op[6:0] <= 78;
		end
		77: begin
			op[15:12] <= JMP;
			op[6:0] <= 62;
		end
/*7$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$^$G(B*/

/*8$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$+$i(B*/
		78: begin
			op[15:12] <= LI;
			op[11:4] <= 0;			//insert 0
			op[3:0] <= 4'b1000;		//into the register No.0101 = 8
		end
		79: begin
			op[15:12] <= INC;
			op[7:4] <= 4'b1000;
			op[3:0] <= 4'b1000;
		end
		80: begin
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b1000;
		end
		81: begin
			op[15:12] <= JNZ;
			op[6:0] <= 62;
		end
		82: begin
			op[15:12] <= COMPARE7;
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b1000;
		end
		83: begin
			op[15:12] <= JNZ;
			op[6:0] <= 79;
		end
		84: begin
			op[15:12] <= COMPARE6;
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b1000;
		end
		85: begin
			op[15:12] <= JNZ;
			op[6:0] <= 79;
		end
		86: begin
			op[15:12] <= COMPARE5;
			op[7:4] <= 4'b0011;
			op[3:0] <= 4'b1000;
		end
		87: begin
			op[15:12] <= JNZ;
			op[6:0] <= 79;
		end
		88: begin
			op[15:12] <= COMPARE4;
			op[7:4] <= 4'b0100;
			op[3:0] <= 4'b1000;
		end
		89: begin
			op[15:12] <= JNZ;
			op[6:0] <= 79;
		end
		90: begin
			op[15:12] <= COMPARE3;
			op[7:4] <= 4'b0101;
			op[3:0] <= 4'b1000;
		end
		91: begin
			op[15:12] <= JNZ;
			op[6:0] <= 79;
		end
		92: begin
			op[15:12] <= COMPARE2;
			op[7:4] <= 4'b0110;
			op[3:0] <= 4'b1000;
		end
		93: begin
			op[15:12] <= JNZ;
			op[6:0] <= 79;
		end
		94: begin
			op[15:12] <= COMPARE1;
			op[7:4] <= 4'b0111;
			op[3:0] <= 4'b1000;
		end
		95: begin
			op[15:12] <= JNZ;
			op[6:0] <= 97;
		end
		96: begin
			op[15:12] <= JMP;
			op[6:0] <= 79;
		end
/*8$B9TL\$N(BQueen$B$NG[CV$K4X$9$k5-=R$O$3$3$^$G(B*/

/*setting up the address for STORE*/
//		97: begin
//			op[15:12] <= LI;
//			op[11:4] <= 0;
//			op[3:0] <= 4'b1111;		//insert 0 into the reg[1111]
//		end
/*THE END OF SETTING UP FOR STORE*/

/*STORE the Combination into the memory*/
//		98: begin
//			op[15:12] <= STORE;
//			op[11:8] <= 4'b0001;
//			op[7:4] <= 4'b1111;		//insert reg[0001] into the memory[ reg[1111] = 0000 = 0 ]
//		end

//		99: begin
//			op[15:12] <= INC;
//			op[7:4] <= 4'b1111;
//			op[3:0] <= 4'b1111;		//Plus 1 to the reg[1111]
//		end
//		100: begin
//			op[15:12] <= STORE;
//			op[11:8] <= 4'b0010;
//			op[7:4] <= 4'b1111;		//insert reg[0010] into the memory[ reg[1111] = 0001 = 1 ]
//		end

//		101: begin
//			op[15:12] <= INC;
//			op[7:4] <= 4'b1111;
//			op[3:0] <= 4'b1111;		//Plus 1 to the reg[1111]
//		end
//		102: begin
//			op[15:12] <= STORE;
//			op[11:8] <= 4'b0011;
//			op[7:4] <= 4'b1111;		//insert reg[0011] into the memory[ reg[1111] = 0010 = 2 ]
//		end

//		103: begin
//			op[15:12] <= INC;
//			op[7:4] <= 4'b1111;
//			op[3:0] <= 4'b1111;		//Plus 1 to the reg[1111]
//		end
//		104: begin
//			op[15:12] <= STORE;
//			op[11:8] <= 4'b0100;
//			op[7:4] <= 4'b1111;		//insert reg[0100] into the memory[ reg[1111] = 0011 = 3 ]
//		end

//		105: begin
//			op[15:12] <= INC;
//			op[7:4] <= 4'b1111;
//			op[3:0] <= 4'b1111;		//Plus 1 to the reg[1111]
//		end
//		106: begin
//			op[15:12] <= STORE;
//			op[11:8] <= 4'b0101;
//			op[7:4] <= 4'b1111;		//insert reg[0101] into the memory[ reg[1111] = 0100 = 4 ]
//		end

//		107: begin
//			op[15:12] <= INC;
//			op[7:4] <= 4'b1111;
//			op[3:0] <= 4'b1111;		//Plus 1 to the reg[1111]
//		end
//		108: begin
//			op[15:12] <= STORE;
//			op[11:8] <= 4'b0110;
//			op[7:4] <= 4'b1111;		//insert reg[0110] into the memory[ reg[1111] = 0101 = 5 ]
//		end

//		109: begin
//			op[15:12] <= INC;
//			op[7:4] <= 4'b1111;
//			op[3:0] <= 4'b1111;		//Plus 1 to the reg[1111]
//		end
//		110: begin
//			op[15:12] <= STORE;
//			op[11:8] <= 4'b0111;
//			op[7:4] <= 4'b1111;		//insert reg[0111] into the memory[ reg[1111] = 0110 = 6 ]
//		end

//		111: begin
//			op[15:12] <= INC;
//			op[7:4] <= 4'b1111;
//			op[3:0] <= 4'b1111;		//Plus 1 to the reg[1111]
//		end
//		112: begin
//			op[15:12] <= STORE;
//			op[11:8] <= 4'b1000;
//			op[7:4] <= 4'b1111;		//insert reg[1000] into the memory[ reg[1111] = 0111 = 7 ]
//		end


		97: begin			//$B$3$3$^$GMh$?$iEz$($,(B1$B$D=P$;$?$3$H$K$J$k$N$G!$2r$N8D?t$r(B1$B%W%i%9$9$k(B
			op[15:12] <= INC;
			op[7:4] <= 4'b1110;
			op[3:0] <= 4'b1110;
		end
		98: begin			//$B$=$7$F$=$N8=:_$N2r$N8D?t$r%a%b%j$N%"%I%l%9(B10$BHV$K3JG<$9$k(B
			op[15:12] <= STORE;
			op[11:8] <= 4'b1110;
			op[7:4] <= 4'b1100;
		end
		99: begin	//79$B$KLa$C$F(B8$BCJL\$K(BQueen$B$^$@$*$1$k$+$J!$$C$F%O%J%7(B
			op[15:12] <= JMP;
			op[6:0] <= 79;
		end
		100: begin	//$B$3$3$G%k!<%W$7$F=*N;(B
			op[15:12] <= JMP;
			op[6:0] <= 100;
		end
		endcase
	end
endmodule
