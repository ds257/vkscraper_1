//lab5
//Diya Saraf & Gwendolyn Patwardhan
//COEN 20 Lab Tuesday
.syntax unified
.cpu cortex-m4
.text
.global MatrixMultiply 
.thumb_func

MatrixMultiply:
		PUSH {R4-R9, LR} //add the extra registers to the stack
		MOV R4, R0 //copy value from R0 to R4				
		MOV R5, R1	//	copy value from R1 to R5		
		MOV R6, R2	//copy value from R2 to R6			
		LDR R7,=0 //load 0 from memory into R7			
top1:	CMP R7,3 //compare value in R7 to 3			
	BGE btm3 //if the value is greater than or equal to, go to btm3		
	LDR R8,=0	//if not, load 0 into R8		

top2:	CMP R8,3 //compare value in R8 to 3	
	BGE btm2 //if the value is greater than or equal to, go to btm2
	LDR R3,=3 //if not, load 3 into R3
	MLA R3,R3,R7,R8 //multiply values in R3 and R7 then add product to R8, and keep in R3
	LDR R1,=0	//load 0 into R1
	STR R1,[R4,R3,LSL 2] //store R4, R3, *2 in R1
	LDR R9,=0 //load 0 into R9

top3:	CMP R9,3 //compare value in R9 to 3
	BGE btm1  //if the value is greater than or equal to, go to btm1		
	LDR R3,=3 //if not, load 3 into R3
	MLA R3,R3,R7,R8	//multiply values in R3 and R7 then add product to R8, and keep in R3
	LDR R0,[R4,R3,LSL 2] //load	R4, R3, *2 in R1
	LDR R3,=3 //load 3 into R3
	MLA R3,R3,R7,R9	//multiply values in R3 and R7 then add product to R9, and keep in R3	
	LDR R1,[R5,R3,LSL 2]	//load	R5, R3, *2 in R1
	LDR R3,=3 //load 3 into R3
	MLA R3,R3,R9,R8		//multiply values in R3 and R9 then add product to R8, and keep in R3
	LDR R2,[R6,R3,LSL 2]	//load	R6, R3, *4 in R2
	BL MultAndAdd //link to MultAndAdd function in C code			
	LDR R3,=3 //load 3 into R3
	MLA R3,R3,R7,R8		//multiply values in R3 and R7 then add product to R8, and keep in R3
	STR R0,[R4,R3,LSL 2] //store R4, R3, *2 in R1	
	ADD R9,R9,1	//add R9 and 1, store in R9
	B top3	//go to top3 (serves as loop)		
		
btm1:	ADD R8,R8,1			
	B top2	//go to top2 (serves as loop)		
		
btm2:	ADD R7,R7,1			
	B top1	//go to top1 (serves as loop)
  
btm3:	POP {R4-R9, PC} //remove extra from stack
	.end
		
btm3:	POP {R4-R9, PC}
	.end