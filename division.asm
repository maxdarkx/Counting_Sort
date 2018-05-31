;div
;r1 dividendo, r2 divisor, r0 cociente, r3 residuo


.orig x7000
ld r1,num1
ld r2,num2
jsr division
halt

num1 .fill #46
num2 .fill #3


division	and r0,r0,#0
			and r3,r3,#0
			st r7,divsave
			lea r7,divsave
			str r1,r7,#1
			str r4,r7,#2
			str r5,r7,#3
			str r6,r7,#4

			not r2,r2
			add r2,r2,#1
			and r4,r4,#0

div_op  	add r1,r1,r2
			brn div_op_out
			
			add r4,r4,#1
		brnzp div_op


div_op_out	add r0,r4,#0
			not r2,r2
			add r2,r2,#1
			add r3,r1,#0
			brzp neg
			add r3,r3,r2
neg			ldr r1,r7,#1
			ldr r4,r7,#2
			ldr r5,r7,#3
			ldr r6,r7,#4
			ldr r7,r7,#0
			Ret

divsave .blkw 5


.end