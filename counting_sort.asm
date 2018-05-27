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


; despues de hallados el maximo y el minimo, establezco el tamano del arreglo de
; ordenamiento= tam=abs(max)+abs(min) 
	ld r4, min
brp max_pos
not r4,r4
add r4,r4,#1

	max_pos ld r5, max
brp min_pos
not r5,r5
add r5,r5,#1

min_pos add r3,r5,r4

st r3,tam 				;distancia entre el mayor valor y el menor, tamano del vector
add r6,r3,#0
ld r3,cant
add r3,r3,#1
ld r5,min 
ld r4,order_vector	;aca se encontrara el primer dato del vector

ld r1,data_address
not r5,r5
add r5,r5,#1
and r7,r7,#0

found 		add r3,r3,#-1
			brn round
		ldr r2,r1,#0
		add r1,r1,#1
		add r2,r2,r5
	brnp found
	add r7,r7,#1
brnzp found

round	str r7,r4,#0
		add r4,r4,#1
		ld r1,data_address
		ld r3,cant
		add r3,r3,#1
		
		
		not r5,r5
		add r5,r5,#1
		add r5,r5,#1
		not r5,r5
		add r5,r5,#1

		and r7,r7,#0
		add r6,r6,#-1
		brzp found

;end order



halt

data_address  .fill x3500
order_vector .fill x5000
cant .fill #10
max .blkw 1
min .blkw 1
tam .blkw 1
.end