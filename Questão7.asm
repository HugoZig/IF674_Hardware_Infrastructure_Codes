init:
	lb x10, 0(x0) #setando o pino
	sb x10, 1030(x0)#de leitura analogica
	addi x3, x0, 205
	addi x4, x0, 307
	addi x5, x0, 408
	addi x6, x0, 519
	addi x7, x0, 614

loop:
	xor x11, x11, x11 #seta 0 na potencia 
	addi x12, x0, 3 #o numero do LED
	sb x11, 1034(x0) #desliga o LED
	addi x12, x0, 5 #o numero do LED
	sb x11, 1034(x0) #desliga o led
	addi x12, x0, 6 #o numero do LED
	sb x11, 1034(x0) #desliga o led
	addi x12, x0, 7 #o numero do LED
	sb x11, 1034(x0) #desliga o led
	addi x12, x0, 10 #o numero do LED
	sb x11, 1034(x0) #desliga o led
	addi x12, x0, 11 #o numero do LED
	sb x11, 1034(x0) #desliga o led

	#---Comp---

	lh x10, 1031(x0)#fazendo a leitura
	blt x10, x3, liga1
	blt x10, x4, liga2
	blt x10, x5, liga3
	blt x10, x6, liga4
	blt x10, x7, liga5
	bge x10, x7, liga6

#vermelho-esquerda
liga1:
	addi x12, x0, 3#o numero do LED
	addi x11, x0, 1023#potencia
	sb x12, 1033(x0)#manda o led pra o arduino
	sb x11, 1034(x0)#manda ligar o led
	jal x0, loop

#amarelo-esquerda
liga2:
	addi x12, x0, 5#o numero do LED
	addi x11, x0, 1023#potencia
	sb x12, 1033(x0)#manda o led pra o arduino
	sb x11, 1034(x0)#manda ligar o led
	jal x0, loop

#amarelo-direita
liga3:
	addi x12, x0, 6#o numero do LED
	addi x11, x0, 1023#potencia
	sb x12, 1033(x0)#manda o led pra o arduino
	sb x11, 1034(x0)#manda ligar o led
	jal x0, loop

#verde-esquerda
liga4:
	addi x12, x0, 9#o numero do LED
	addi x11, x0, 1023#potencia
	sb x12, 1033(x0)#manda o led pra o arduino
	sb x11, 1034(x0)#manda ligar o led
	jal x0, loop

#verde-direita
liga5:
	addi x12, x0, 10#o numero do LED
	addi x11, x0, 1023#potencia
	sb x12, 1033(x0)#manda o led pra o arduino
	sb x11, 1034(x0)#manda ligar o led
	jal x0, loop

#vermelho-direita
liga6:
	addi x12, x0, 11#o numero do LED
	addi x11, x0, 1023#potencia
	sb x12, 1033(x0)#manda o led pra o arduino
	sb x11, 1034(x0)#manda ligar o led
	jal x0, loop



