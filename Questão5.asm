#um registrador vai ficar constantemente
#recebendo o valor que vai ser inc

#um registrador vai fazer o controle de
#fluxo de qual registrador (a ou b) vai
#ser incrementado

data:
	addi x13, x13, 13 #enter
	xor x14, x14, x14 #player count
	addi x21, x0, 2 #endflag

clean:
	xor x15, x15, x15
	beq x14, x21, champion #jmp to end

loop:
	lb x5, 1025(x0)
	beq x5, x13, change
	jal x0, setcmp1
#---------------------------------------
setcmp1:
	xor x6, x6, x6
	addi x6, x6, 1 #tamanho do inc
	xor x10, x10, x10
	addi x10, x10, 536 #endereçodep1
	xor x11, x11, x11
	addi x11, x10, 5 #endereço + 5

loopcmp1:
	lb x12, 0(x10)
	beq x5, x12, inc
	addi x10, x10, 1
	bge x11, x10, loopcmp1
#--------------------------------------
setcmp2:
	xor x6, x6, x6
	addi x6, x6, 2 #tamanho do inc
	xor x10, x10, x10
	addi x10, x10, 542 #endereçodep2
	xor x11, x11, x11
	addi x11, x10, 3 #endereço + 3

loopcmp2:
	lb x12, 0(x10)
	beq x5, x12, inc
	addi x10, x10, 1
	bge x11, x10, loopcmp2
#-----------------------------------------
setcmp3:
	xor x6, x6, x6
	addi x6, x6, 3 #tamanho do inc
	xor x10, x10, x10
	addi x10, x10, 546 #endereçodep2
	xor x11, x11, x11
	addi x11, x10, 5 #endereço + 5

loopcmp3:
	lb x12, 0(x10)
	beq x5, x12, inc
	addi x10, x10, 1
	bge x11, x10, loopcmp3
#---------------------------------------

setcmp4:
	xor x6, x6, x6
	addi x6, x6, 4 #tamanho do inc
	xor x10, x10, x10
	addi x10, x10, 552 #endereçodep2
	xor x11, x11, x11
	addi x11, x10, 5 #endereço + 5

loopcmp4:
	lb x12, 0(x10)
	beq x5, x12, inc
	addi x10, x10, 1
	bge x11, x10, loopcmp4
#---------------------------------------

setcmp5:
	xor x6, x6, x6
	addi x6, x6, 5 #tamanho do inc
	xor x10, x10, x10
	addi x10, x10, 558 #endereçodep2
	xor x11, x11, x11
	addi x11, x10, 3 #endereço + 3

loopcmp5:
	lb x12, 0(x10)
	beq x5, x12, inc
	addi x10, x10, 1
	bge x11, x10, loopcmp5
#---------------------------------------

setcmp8:
	xor x6, x6, x6
	addi x6, x6, 8 #tamanho do inc
	xor x10, x10, x10
	addi x10, x10, 562 #endereçodep2
	xor x11, x11, x11
	addi x11, x10, 3 #endereço + 3

loopcmp8:
	lb x12, 0(x10)
	beq x5, x12, inc
	addi x10, x10, 1
	bge x11, x10, loopcmp8
#---------------------------------------

setcmp10:
	xor x6, x6, x6
	addi x6, x6, 10 #tamanho do inc
	xor x10, x10, x10
	addi x10, x10, 566 #endereçodep2
	xor x11, x11, x11
	addi x11, x10, 2 #endereço + 2

loopcmp10:
	lb x12, 0(x10)
	beq x5, x12, inc
	addi x10, x10, 1
	bge x11, x10, loopcmp10
#---------------------------------------
inc:
	add x15, x15, x6
	jal x0, loop

change:
	xor x6, x6, x6 
	beq x0, x14, player1
	jal x0, player2
 
#-----------81--------------------------
player1:
	addi x14, x0, 1 
	add x19, x0, x15 #x19 valor de p1
	addi x6, x0, 49
	sw x6, 1024(x0)
	addi x6, x6, 9 
	sw x6, 1024(x0)
	jal x0, print100 #10

player2:
	addi x14, x14, 1
	add x20, x0, x15
	xor x6,x6, x6
	addi x6, x0, 50
	sw x6, 1024(x0)
	addi x6, x6, 8 
	sw x6, 1024(x0)
	jal x0, print100 #18

print100:
	addi x16, x0, 100 #comparador 100
	loop100:
		blt x15, x16, print10
		addi x15, x15, -100
		addi x17, x17, 1 #armazena centena
		jal x0, loop100
#------------ 100----------------------
	
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
	sw x17, 1024(x0)
	addi x15, x15, 48
	sw x15, 1024(x0)
	sw x13, 1024(x0)
	xor x15, x15, x15
	xor x17, x17, x17
	addi x15, x15, 1
	beq x14, x15, clean

champion:
	blt x20, x19, win1
	blt	x19, x20, win2
	beq x19, x20, empate
#------------ 119 -------------------

win1:
	addi x17, x17, 49
	sb x17, 1024(x0)
	jal x0, end

win2:
	addi x17, x17, 50
	sb x17, 1024(x0)
	jal x0, end

empate:
	addi x17, x17, 69
	sb x17, 1024(x0)
	jal x0, end

end:
	halt

p1: .string "AEIOU"
p2: .string "DGT"
p3: .string "BCMNP"
p4: .string "FHVWY"
p5: .string "KRS"
p8: .string "JLX"
p10:.string "QZ"






