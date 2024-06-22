.data
.arrayA:
.word 1
.word 2
.word 0
.word 0
.word 0
.word 0

main:
add t2,zero,zero #i = 0
addi sp,sp,-16
sw t0,0(sp)
sw t3,sp,8
sw t5,sp,16
subi 0,t2,6 #i < 6
bge t0,t2 Exit #s2 became t0
slli s10,s2,3      
addi t3,t0,8  #setting up i+1
addi t5,t0,16  #setting up i+2
ld t3,t1(t0) #loading i+1 into argument register
ld t5,t1(t3) #loading i+2 into argument register
j myfunc
sw s11,t1(t5) #set to x1 
addi s2,s2,1 #i++


.myfunc:
sub t6,t5,t3 #num2-num1 x31
slli t6,t6,2 #multiplies x31 times 2^2 = 4
addi a0,t6,0 #setting x31 value to return address

jr sp

Exit:
lw s2,sp,0 #loading elements back from Stack pointer
lw t3,sp,8
lw t5,sp,16
addi a1,s0,0 #return 0