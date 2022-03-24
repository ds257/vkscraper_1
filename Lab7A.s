//Diya Saraf & Gwendolyn Patwardhan
//COEN 20 Tuesday Section
//Week 9, lab 7A
.syntax unified
.cpu cortex-m4
.text

CallReturnOverhead: BX LR //call given C function

.global ReverseBits
.thumb_func
.align
ReverseBits:
    .rept 32 //start loop to parse through 32 bits
    LSLS R0, R0, 1 //left shift left with flags
    RRX R1, R1 //rotate right with extend
    .endr //end loop
    MOV R0, R1 //copy R1 into R0
    BX LR //end func

.global ReverseBytes
.thumb_func
.align
ReverseBytes: 

   BFI R1, R0, 24, 8 //insert 1st byte
   LSR R0, R0, 8 //shift 8 bits right
   BFI R1, R0, 16, 8 //insert 2nd byte
   LSR R0, R0, 8 //shift 8 bits right
   BFI R1, R0, 8, 8 //insert 3rd byte
   LSR R0, R0, 8 //shift 8 bits right
   BFI R1, R0, 0, 8 //insert 4th + final byte
   MOV R0, R1 //copy R1 into R0
   BX LR //end func
