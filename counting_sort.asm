.orig x3000

ld r6,data_address ;direccion del primer dato

add r5,r6,#0
jsr cant_data
ld r4,cant
;add r4,r4,#1

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
;add r4,r4,#1

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
add r3,r3,#1			;cantidad de datos que tiene el vector inicial (mas uno para la inicializacion del bucle)
ld r5,min 				;valor minimo hallado, aca arranca el vector a buscar datos 
ld r4,order_vector		;aca se encontrara el primer dato del vector

ld r1,data_address
not r5,r5
add r5,r5,#1
and r7,r7,#0

found 		add r3,r3,#-1 	;comienza a buscar datos en el vector hasta que no halla mas
			brnz round  		; en cada ronda debo hallar un dato en todo el vector
		ldr r2,r1,#0 		; cargo un dato del vector e incremento la direccion en uno
		add r1,r1,#1 		; para la siguiente iteracion
		add r2,r2,r5 		; si el dato es igual al que tengo en r5, incremento el contador en uno
	brnp found
	add r7,r7,#1
brnzp found

round	str r7,r4,#0 		;cuando ya haya recorrido todo el vector comparandolo con el dato,
		add r4,r4,#1 		;entonces cambio de dato a buscar
		ld r1,data_address  ; y busco en todo el vector ese dato
		ld r3,cant
		add r3,r3,#1
		
		
		not r5,r5 			;para no cargar el dato buscado otra vez, le cambio el signo
		add r5,r5,#1 		; al que ya tenia guardado, le sumo #1 y le cambio el signo otra vez
		add r5,r5,#1
		not r5,r5
		add r5,r5,#1

		and r7,r7,#0
		add r6,r6,#-1 		;en r6 voy a tener la cantidad de datos que me falta buscar en el vector
		brzp found

;end order
;ahora desde la posicion x5000 tengo el que en el codigo de C se le llama temp, con 
;las cantidades de apariciones de cada dato.
;ahora debo sacar el vector ordenado, e imprimirlo en pantalla
;el vector ordenado va a estar ubicado en la posicion x6000
; se debe recorrer el vector ubicado en x5000 hasta el total de datos encontrados

ld r6, ordered_vector ;leo las direcciones iniciales de los vectores y sus tamanos
ld r5, order_vector
ld r4, tam
ld r3, cant
ld r2, min



end_order_vector 

			ldr r1,r5,#0 	;si en la posicion que busco hay datos, debo meter ese dato en el vector
			brnz not_found1
found1 		
			str r2,r6,#0 	;guardo en el vector final tantos datos como haya en esa posicion
			add r6,r6,#1
			add r1,r1,#-1
			brp found1

not_found1	add r5,r5,#1 	;si no hay datos entonces me muevo a la proxima posicion
			add r2,r2,#1
			add r4,r4,#-1
			brzp end_order_vector

;convertir a ascii el valor encontrado
 ;chequear
 ;		ld r6,ordered_vector
 ;		and r0,r0,#0
 ;		and r2,r2,#0
 ;		add r2,r2,#10 		;multiplicador
 ;		and r3,r3,#0  		;residuo
 ;		ld r4, ascii_dd  	;conversor de numero a ascii
 ;		ld r5,cant 			;cantidad de numeros a convertir
 ;ascii_c	ldr r1,r6,#0 		;cargo la primera posicion en memoria
 ;		brzp asciipos
		
 ;		not r1,r1 			;si el dato es negativo, lo niego
 ;		add r1,r1,#1
 ;		ld r0,ascii_minus ;lo que hay en r0 se imprime en pantalla
 ;		out
 ;asciipos jsr division
 ;		add r1,r0,#0  ;guardo el nuevo dato en r1
 ;		and r0,r0,#0
 ;		add r0,r0,r4  ;le sumo al residuo el conversor para sacar el numero al reves
 ;		add r0,r0,r3
 ;		out
 ;		add r1,r1,#0
 ;		brp asciipos
 ;		and r1,r1,#0
 ;		ld r0,space
 ;		out
 ;		add r6,r6,#1
 ;		add r5,r5,#-1
 ;		brzp ascii_c



;convertir a ascii el valor encontrado
 ;chequear r2,r3,r4,r7
 			ld r6,ordered_vector
 			and r0,r0,#0

 			jsr store_reset
 		
 			and r3,r3,#0  		;residuo
 ascii_c	ldr r1,r6,#0 		;cargo la primera posicion en memoria
 			brzp asciipos
		
 			not r1,r1 			;si el dato es negativo, lo niego
 			add r1,r1,#1
 			ld r0,ascii_minus ;lo que hay en r0 se imprime en pantalla

 			;out
 			;-
 			lea r2,asciiConvTemp
 			str r0,r2,#0
 			;-

asciipos 	and r2,r2,#0
	 		add r2,r2,#10 		;multiplicador
	 		jsr division
	 		add r1,r0,#0  ;guardo el nuevo dato en r1
	 		and r0,r0,#0

	 		ld r4, ascii_dd  	;conversor de numero a ascii
	 		add r0,r0,r4  ;le sumo al residuo el conversor para sacar el numero al reves
	 		add r0,r0,r3

	 		;out
	 		;-
 			jsr store_temp
 			;-

	 		add r1,r1,#0
	 		brp asciipos



	 		;-
	 		jsr store_save
 			jsr store_reset
			;-

	 		add r6,r6,#1
	 		ldr r5,r6,#0
	 		brnp ascii_c
ld r0, ascii_vector
puts
	
;chequear



halt

data_address  .fill x3500 	;posicion del vector a ordenar
order_vector .fill x5000 	;posicion del vector de orden
ordered_vector .fill x8000  ;posicion del vector ordenado
ascii_vector .fill xa000 	;posicion de los datos a imprimir
ascii_pointer .fill xa000   ;posicion actual a rellenar
cant .fill #15 			;tamano del vector a ordenar
max .blkw 1					;numero maximo
min .blkw 1 				;numero minimo
tam .blkw 1 				;distancia entre el mayor valor y el menor, tamano del vector order_vector
asciiConvTemp .blkw 8
ascii_temp_pointer .fill asciiConvTemp
ascii_dd .fill x0030
ascii_minus .fill #45
space .fill #32




store_temp	ld r2,ascii_temp_pointer
 			str r0,r2,#0
 			add r2,r2,#-1
 			st r2,ascii_temp_pointer
			ret




store_reset
			st r0,tmp
			st r1,tmp2

			and r0,r0,#0
			and r1,r1,#0
			add r1,r1,#7

			lea r2,asciiConvTemp
    delete	str r0,r2,#0
			add r2,r2,#1
			add r1,r1,#-1
			brzp delete
			add r2,r2,#-1
			st r2, ascii_temp_pointer
			ld r0,tmp
			ld r1,tmp2
 			ret

tmp .blkw 1
tmp2 .blkw 1


store_save  st r0, temp_save
			st r1, temp_save1
			st r2, temp_save2
			st r3, temp_save3
			and r3,r3,#0
			add r3,r3,#7

			lea r2, asciiConvTemp
			ld r1, ascii_pointer
	save	ldr r0,r2,#0
			brz not_save
			str r0,r1,#0
			add r1,r1,#1
not_save	
			add r2,r2,#1
			add r3,r3,#-1
			brzp save
			ld r0,space
			str r0,r1,#0
			add r1,r1,#1
			st r1,ascii_pointer

			ld r0, temp_save
			ld r1, temp_save1
			ld r2, temp_save2
			ld r2, temp_save3

			ret
			temp_save .blkw 1
			temp_save1 .blkw 1
			temp_save2 .blkw 1
			temp_save3 .blkw 1

cant_data st r0,temp_cant
		  st r1, temp_cant2
		  st r2, temp_cant3
		  st r5, temp_cant5
		  ld r2, centinela
		  not r2,r2
		  add r2,r2,#1


		  and r1,r1,#0
		  add r1,r1,#-1

count	  add r1,r1,#1
		  ldr r0,r5,#0
		  add r5,r5,#1
		  add r0,r0,r2
		  brnp count 
		  st r1, cant

		  ld r1,temp_cant2
		  ld r0,temp_cant
		  ld r2,temp_cant3
		  ld r5, temp_cant5
 		  ret
temp_cant .blkw 1
temp_cant2 .blkw 1
temp_cant3 .blkw 1
temp_cant5 .blkw 1
centinela .fill x8000

;r1 dividendo, r2 divisor, r0 cociente, r3 residuo
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