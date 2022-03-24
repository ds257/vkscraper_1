//lab 4
//tuesday
//Diya Saraf & Gwendolyn Patwardhan
.syntax unified
.cpu cortex-m4
.text

//assuming W in R0, A in R1, and R in R2
.global TireDiam
.thumb_func
.align
TireDiam: 
    MUL         R0,R0,R1        //Multiplies W * A, saves into R0
    LDR         R1,=1270        //Loads R1 with 1270
    UDIV        R3,R0,R1        //Divides (W*A) / R3, saves into R3
    MLS         R0,R1,R3,R0     //Finds the remainder R0 - R1*R3, saves into R1
    ADD         R1,R2,R3        //Adds R + (W*A) / R3, saves into R0
    BX          LR              //Returns

.global TireCirc
.thumb_func
.align
TireCirc:
    PUSH        {LR}
    BL          TireDiam        //calls TireDiam function
    LDR         R2,=4987290     //Loads R2 with 4987920
    MUL         R1,R2,R1        //Multiples 4987920 * D(62-32), saves into R1
    LDR         R2,=3927        //Loads R2 with 3927
    MLA         R0,R2,R0,R1     //Multiples (3927 * D(31-00)) + (4987920 * D(62-32)), saves into R0
    LDR         R2,=1587500     //Loads R2 with 1587500
    UDIV        R1,R0,R2        //Divides (3927 * D(31-00)) + (4987920 * D(62-32)) / 1587500, saves into R1 
    MLS         R0,R2,R1,R0     //Finds the remainder R0 - R1*R2, saves into R0
    POP         {PC}            //Returns
.end