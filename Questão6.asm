comeco:
lw x2, 1025(x0)
beq x0, x2, printa #quando o input acabar, printa o resultado
addi x2, x2, -48 #pegando o valor inteiro
jal x29, computa  #computa o fatorial de x2
add x28, x5, x28 #adicionamos o fatorial ao valor final
beq x0, x0, comeco #lemos um novo numero  

computa:
add x3, x0, x0 #zera x3
addi x1, x0, 1 #x1 = 1
sub x3, x2, x1 #x3 = x2-1 
add x5, x0, x2 #utilizamos x5 como um "holder" de valor
bge x3, x1, fat #se x2 >= 2, calculamos o fatorial
beq x0, x0, ret2 #retonamos para comeco

#funcao fatorial
fat:
	beq x3, x1, ret2
	add x4, x0, x5
	xor x5, x0, x0
	add x6, x0, x3
	jal x8, mul
	add x3, x0, x6 
	sub x2, x2, x1
	sub x3, x3, x1
	beq x0, x0, fat
	
#funcao multiplicacao	
mul: 
beq x0, x3, ret
addi x3, x3, -1
add x5, x5, x4
beq x0, x0, mul


ret:
	jalr x0, 0(x8) #retorna para fat 

ret2:
	jalr x0, 0(x29) #retorna para comeco


#printa o produto
#usamos os registradores de 12 a 17 para calcular a quantidade de dezenas, centenas, milhares... que pertecem ao numero
printa: 
xor x11, x11, x11
add x10, x0, x28
addi x12, x0, 10
addi x13, x0, 100
addi x14, x0, 1000
lw x15, dez_mil
lw x16, cinquenta_mil
add x16, x16, x16 #100mil
add x17, x16, x16 #200mil
add x17, x17, x17 #400mil
add x17, x17, x17 #800mil
add x17, x17, x16 #900mil
add x17, x17, x16 #1milhao

loop_milhao:
	blt x10, x17, print7
	addi x11, x11, 1
	sub x10, x10, x17  
	jal x0, loop_milhao

print7:
	addi x11, x11, 48 #casa decimal
	sb x11, 1024(x0)
	xor x11, x11, x11


loop_centena_mil:
	blt x10, x16, print6
	addi x11, x11, 1
	sub x10, x10, x16
	jal x0, loop_centena_mil

print6:
	addi x11, x11, 48 #casa decimal
	sb x11, 1024(x0)
	xor x11, x11, x11
	
	
loop_dezena_mil:
	blt x10, x15, print5
	addi x11, x11, 1
	sub x10, x10, x15
	jal x0, loop_dezena_mil

print5:
	addi x11, x11, 48 #casa decimal
	sb x11, 1024(x0)
	xor x11, x11, x11
	
	
loop_milhares:
	blt x10, x14, print4
	addi x11, x11, 1
	addi x10, x10, -1000
	jal x0, loop_milhares

print4:
	addi x11, x11, 48 #casa decimal
	sb x11, 1024(x0)
	xor x11, x11, x11


loop_centenas: 
	blt x10, x13, print3
	addi x11, x11, 1
	addi x10, x10, -100
	jal x0, loop_centenas

print3:
	addi x11, x11, 48 #centenas
	sb x11, 1024(x0)
	xor x11, x11, x11

loop_dezenas:
	blt x10, x12, print2
	addi x11, x11, 1
	addi x10, x10, -10
	jal x0, loop_dezenas


print2:
	addi x11, x11, 48 #casa decimal
	sb x11, 1024(x0)
	xor x11, x11, x11


fim:	
	addi x10, x10, 48 #unidades
	sb x10, 1024(x0)
	halt 

dez_mil: .word 0x2710
cinquenta_mil: .word 0xC350


temp: .word 0x0




