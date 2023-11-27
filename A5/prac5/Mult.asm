// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@3
M=0

@R1			// jump to pos1 if r1 is pos
D=M
@POS1
D;JGT

@R1			// else set r1 as -r1
M=M-D
M=M-D
@3			
M=M+1

(POS1)
@R2			// jump to pos2 if r2 is pos
D=M
@POS2
D;JGT

@R2			// else set r1 as -r1
M=M-D
M=M-D

@3
D=M
@TWONEGATIVES
D;JEQ
@3
M=M-1
@POS2
0;JMP
(TWONEGATIVES)
@3			
M=M+1

(POS2)
@R0
M=0

@R1
D=M
@END
D;JEQ
@R2
D=M
@END
D;JEQ

(LOOP)
@R1
D=M
@R0
M=D+M
@R2
M=M-1
D=M
@LOOP
D;JGT

@3
D=M
@END
D;JEQ

@R0
D=M
M=M-D
M=M-D

(END)
@END
0;JMP