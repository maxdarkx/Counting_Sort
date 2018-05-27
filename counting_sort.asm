.orig x3000

ld r6,data_address ;direccion del primer dato

add r5,r6,#0
ld r4,cant 
add r4,r4,#1

ldr r2,r5,#0
add r3,r2,#0
not r3,r3
add r3,r3,#1

max_val		 		add r4,r4,#0
				brz fin_max
				ldr r1,r5,#0	;utilizo el primer dato del arreglo
				add r5,r5,#1	;le sumo uno a la direccion
				add r4,r4,#-1
				add r0,r1,r3	;verifico si el valor que tengo es mayor (val[i]-max>0)
			brnz max_val
		
			add r2,r1,#0
			not r3,r2
			add r3,r3,#1
		
		brnzp max_val
fin_max	st r2,max

add r5,r6,#0
ld r4,cant
add r4,r4,#1

min_val				add r4,r4,#0
				brz fin_min
				ldr r1,r5,#0	;utilizo el primer dato del arreglo
				add r5,r5,#1	;le sumo uno a la direccion
				add r4,r4,#-1
				add r0,r1,r3	;verifico si el valor que tengo es menor (val[i]-min>0)
			brp min_val
			
			add r2,r1,#0
			not r3,r2
			add r3,r3,#1
			
		brnzp min_val
fin_min	st r2,min

halt

data_address  .fill x3500
cant .fill #10
max .blkw 1
min .blkw 1
.end