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
			op[11:4] <= 0;		//はじめは個数は当然0個
			op[3:0] <= 4'b1110;		//解の個数を数える場所(アドレス)がレジスタにおける4'b1110
		end
		1: begin
			op[15:12] <= LI;
			op[11:4] <= 10;		//解の個数を入れる先の，メモリのアドレスを10=4'b1010とした
			op[3:0] <= 4'b1100;		//そのメモリのアドレスの値10をレジスタのアドレス4'b1100に格納しておく
		end

///////////////////////////////////////////////////////////////////////////////////////////////////////
/*1行目にQueenを置く行程がここから*/
		2: begin
			op[15:12] <= LI;
			op[11:4] <= 0;			//値0に初期化して，
			op[3:0] <= 4'b0001;		//register No.0001 = 1に入れる
		end
		3: begin
			op[15:12] <= INC;		//the register No.0001 = 1に入っている値を1足して，元のアドレスに値を戻す
			op[7:4] <= 4'b0001;		//インクリメントしたい値
			op[3:0] <= 4'b0001;		//インクリメント後にその値を入れるレジスタのアドレス
		end
///////////////////////////////////////////////////////////////////////////////////////////////////////

/*CHECK if you cannot place a queen in the first row anymore...*/
		4: begin	//1行目のQueenの位置が8を超えたら116に飛ぶ
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0001;
		end
		5: begin
			op[15:12] <= JNZ;
			op[6:0] <= 100;			//もし8を超えてたら，Queenは盤の外なので，探索終了でpc=116へ
		end
/////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////
/*これより下は2行目にQueenを置く作業です*/
		6: begin		//Queenの位置を初期化する
			op[15:12] <= LI;
			op[11:4] <= 0;			//insert 0
			op[3:0] <= 4'b0010;		//into the register No.0010 = 2
		end
		7: begin		//Queenの位置を1つひだりに動かす
			op[15:12] <= INC;
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0010;		//Plus 1 to the number in the register No.0010
		end
		8: begin		//Queenの位置が盤の外に出たら，次のJNZで1行前のQueenの操作に戻る
			op[15:12] <= CHECK;
			op[11:4] <= 8;
			op[3:0] <= 4'b0010;
		end
		9: begin
			op[15:12] <= JNZ;
			op[6:0] <= 3;
		end
		10: begin	//1行目のQueenにより置けなくなった位置に2行目のQueenが重なっているか判断
			op[15:12] <= COMPARE1;
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0010;
		end
		11: begin	//来ていなければ2段目のQueenは置けて3段目に移動
			op[15:12] <= JNZ;		//if there's a flag, jump to the next Row No.3!!
			op[6:0] <= 13;
		end
		12: begin
			op[15:12] <= JMP;
			op[6:0] <= 7;		//pc=7に戻る
		end
/*2行目のQueenの配置に関する記述はここまで*/

/*3行目のQueenの配置に関する記述はここから*/
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
		17: begin		//1行目のQueenにより置けなくなった位置に3行目のQueenが来ているか判断
			op[15:12] <= COMPARE2;
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0011;
		end
		18: begin
			op[15:12] <= JNZ;
			op[6:0] <= 14;
		end
		19: begin		//2行目のQueenにより置けなくなった位置に3行目のQueenが来ているか判断
			op[15:12] <= COMPARE1;
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0011;
		end
		20: begin
			op[15:12] <= JNZ;
			op[6:0] <= 22;		//22にジャンプして，4段目のQueenを配置する作業に行く
		end
		21: begin
			op[15:12] <= JMP;
			op[6:0] <=14;		//14に戻る
		end
/*3行目のQueenの配置に関する記述はここまで*/

/*4行目のQueenの配置に関する記述はここから*/
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
			op[15:12] <= COMPARE3;		//1行目のQueenにより置けなくなった位置に4行目のQueenが来ているか判断
			op[7:4] <= 4'b0001;
			op[3:0] <= 4'b0100;
		end
		27: begin
			op[15:12] <= JNZ;			//来てたら23に戻り，4行目のQueenの位置をひだりに1個ずらす
			op[6:0] <= 23;
		end
		28: begin
			op[15:12] <= COMPARE2;		//2行目のQueenにより置けなくなった位置に4行目のQueenが来ているか判断
			op[7:4] <= 4'b0010;
			op[3:0] <= 4'b0100;
		end
		29: begin
			op[15:12] <= JNZ;			//23に戻る
			op[6:0] <= 23;
		end
		30: begin
			op[15:12] <= COMPARE1;		//3行目のQueenにより置けなくなった位置に4行目のQueenが来ているか判断
			op[7:4] <= 4'b0011;
			op[3:0] <= 4'b0100;
		end
		31: begin
			op[15:12] <= JNZ;			//無事置けていたら33に移動し，5行目のQueenの配置作業へ
			op[6:0] <= 33;
		end
		32: begin
			op[15:12] <= JMP;
			op[6:0] <=23;
		end
/*4行目のQueenの配置に関する記述はここまで*/

/*5行目のQueenの配置に関する記述はここから*/
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
/*5行目のQueenの配置に関する記述はここまで*/

/*6行目のQueenの配置に関する記述はここから*/
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
/*6行目のQueenの配置に関する記述はここまで*/

/*7行目のQueenの配置に関する記述はここから*/
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
/*7行目のQueenの配置に関する記述はここまで*/

/*8行目のQueenの配置に関する記述はここから*/
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
/*8行目のQueenの配置に関する記述はここまで*/

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


		97: begin			//ここまで来たら答えが1つ出せたことになるので，解の個数を1プラスする
			op[15:12] <= INC;
			op[7:4] <= 4'b1110;
			op[3:0] <= 4'b1110;
		end
		98: begin			//そしてその現在の解の個数をメモリのアドレス10番に格納する
			op[15:12] <= STORE;
			op[11:8] <= 4'b1110;
			op[7:4] <= 4'b1100;
		end
		99: begin	//79に戻って8段目にQueenまだおけるかな，ってハナシ
			op[15:12] <= JMP;
			op[6:0] <= 79;
		end
		100: begin	//ここでループして終了
			op[15:12] <= JMP;
			op[6:0] <= 100;
		end
		endcase
	end
endmodule
