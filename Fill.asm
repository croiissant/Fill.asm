(RESTART)
@SCREEN
D=A
@0
M=D	//load screen start location into RAM0

///////////////////////////
(KBDCHECK)

@KBD
D=M
@BLACK
D;JGT	//jump to black if any key is pressed
@WHITE
D;JEQ	//else jump to white

@KBDCHECK
0;JMP
///////////////////////////
(BLACK)
@1
M=-1	//filling the screen with black (-1=11111111111111)
@CHANGE
0;JMP

(WHITE)
@1
M=0	//filling the screen with white
@CHANGE
0;JMP
//////////////////////////
(CHANGE)
@1	//Color check for what to fill
D=M	//Contains either black or white

@0
A=M	//Get adress of pixel to fill
M=D	//fill it 

@0
D=M+1	//INC to next pixel
@KBD
D=A-D	//KBD-SCREEN=A

@0
M=M+1	//INC to next pixel
A=M

@CHANGE
D;JGT	//IF A=0 exit as screen = black 
/////////////////////////
@RESTART
0;JMP