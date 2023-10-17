init:
	addi x11, x0, 10 #multiplicador
	addi x14, x0, 13 #enter
	addi x7, x0, 1 #used as flag
	addi x6, x0, 65 #a
	addi x5, x0, 61 #=
	sb x6, 1024(x0)
	sb x5, 1024(x0)

getnum:
	lw x9, 1025(x0) #pega o char
	sw x9, 1024(x0)
	beq x9, x14, endget #igual enter
	addi x9, x9, -48 #transf em algarismo
	jal x0, mult

grownum:
	add x10, x10, x9 #resultado em x10
	jal x0, getnum

mult:
	add x13, x13, x10
	addi x12, x12, 1
	bne x12, x11, mult
	xor x10, x10, x10 #limpando
	add x10, x10, x13 #colocando o resultado a mult
	xor x12, x12, x12 #limpando
	xor x13, x13, x13 #limpando
	jal x0, grownum

endget:
	blt x8, x7, a
	beq x8, x7, b
	bge x8, x7, c
	

a:
	add x15, x15, x10
	xor x10, x10, x10
	addi x8, x8, 1
	addi x6, x6, 1
	sb x6, 1024(x0)
	sb x5, 1024(x0)
	jal x0, getnum
b:
	add x16, x16, x10
	xor x10, x10, x10
	addi x8, x8, 1
	addi x6, x6, 1
	sb x6, 1024(x0)
	sb x5, 1024(x0)
	jal x0, getnum

c:
	add x17, x17, x10
	jal x0, cond1

cond1:
	xor x10, x10, x10 #limpando os registradores
	xor x9, x9, x9
	xor x8, x8, x8
	xor x7, x7, x7

	bge x15, x0, cond2
	jal x0, result

cond2:
	addi x7, x7, 64
	bge x7, x16, cond3
	jal x0, result

cond3:
	addi x8, x8, 23
	blt x8, x17 , incx
	jal x0, result

incx:
	addi x9, x9, 1
	jal x0, result

result:
	addi x12, x0, 120
	sw x12, 1024(x0)
	sw x5, 1024(x0)
	addi x9, x9, 48
	sw x9, 1024(x0)

