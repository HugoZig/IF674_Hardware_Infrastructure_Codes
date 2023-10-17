#um registrador vai ficar constantemente
#recebendo o valor que vai ser inc

#um registrador vai fazer o controle de
#fluxo de qual registrador (a ou b) vai
#ser incrementado

data:
	addi x13, x13, 13 #enter
	xor x14, x14, x14 #player count

loop:
	lb x5, 1025(x0)
	beq x5, x13, print100

setcmp1:
	xor x6, x6, x6
	addi x6, x6, 1 #tamanho do inc
	xor x10, x10, x10
	addi x10, x10, 140 #endereçodep1
	xor x11, x11, x11
	addi x11, x10, 10 #endereço + 5

loopcmp1:
	lb x12, 0(x10)
	beq x5, x12, inc
	addi x10, x10, 1
	bge x11, x10, loopcmp1
	jal x0, loop

inc:
	add x15, x15, x6
	jal x0, loop

print100:
	addi x16, x0, 100 #comparador 100
	loop100:
		blt x15, x16, print10
		addi x15, x15, -100
		addi x17, x17, 1 #armazena centena
		jal x0, loop100
	
print10:
	addi x17, x17, 48
	sb x17, 1024(x0) #printacentena
	xor x16, x16, x16
	xor x17, x17, x17#armazena dezena
	addi x16, x0, 10 #comparador 10
	loop10:
		blt x15, x16, printuni
		addi x15, x15, -10
		addi x17, x17, 1
		jal x0, loop10

printuni:
	addi x17, x17, 48
	sb x17, 1024(x0)
	addi x15, x15, 48
	sb x15, 1024(x0)
		
p1: .string "AEIOUaeiou"







