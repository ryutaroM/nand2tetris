// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed,
// the screen should be cleared.

//// Replace this comment with your code.
//LOOP:
//    i = 0
//    if KBD > 0 goto WRITE
//    goto BLANK

//WRITE:
//    if i > R0 goto LOOP
//    screen[i] = -1
//    i = i + 1
//    goto WRITE

//BLANK:
//    if i > R0 goto LOOP
//    screen[i] = 0
//    i = i + 1
//    goto BLANK

    @8191
    D=A
    @R0
    M=D
    @i
    M=0

(LOOP)
    @i
    M=0

    @KBD
    D=M

    @WRITE
    D;JGT

    @BLANK
    D;JMP
(WRITE)
    @i
    D=M
    @R0
    D=D-M
    @LOOP
    D;JGT

    @SCREEN
    D=A
    @i
    A=D+M
    M=-1

    //i=i+1
    @i
    M=M+1

    @WRITE
    0;JMP

(BLANK)
    @i
    D=M
    @R0
    D=D-M
    @LOOP
    D;JGT

    @SCREEN
    D=A
    @i
    A=D+M
    M=0

    //i=i+1
    @i
    M=M+1

    @BLANK
    0;JMP