#lemos o primeiro bit e chamamos a funcao seguinte
temos:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, temos0 #se o bit for 0, "temos" 0
beq x0, x0, temos1 #se o bit for 1, "temos" 1
xor x11, x0, x0
xor x10, x0, x0


#leitura do segundo bit quando o primeiro bit eh 0
temos0:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, temos00 #se o bit for 0, "temos" 00
beq x0, x0, temos01 #se o bit for 1, "temos" 01


#leitura do segundo bit quando o primeiro bit eh 1
temos1:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, temos10 #se o bit for 0, "temos" 10
beq x0, x0, temos11 #se o bit for 1, "temos" 11


#leitura do terceiro bit quando os dois primeiros sao 00
temos00:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, temos000 #se o bit for 0, "temos" 000
beq x0, x0, temos001 #se o bit for 1, "temos" 001


#leitura do terceiro bit quando os dois primeiros sao 01
temos01:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, temos010 #se o bit for 0, "temos" 010
beq x0, x0, temos011 #se o bit for 1, "temos" 011


#leitura do terceiro bit quando os dois primeiros sao 10
temos10:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, temos100 #se o bit for 0, "temos" 100
beq x0, x0, temos #se o bit for 1, "temos" 101 e nao ha comando com esse comeco, entao voltamos ao inicio


#leitura do terceiro bit quando os dois primeiros sao 11
temos11:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, temos #se o bit for 0, "temos" 110 e nao ha comando com esse comeco, entao voltamos ao inicio
beq x0, x0, temos111 #se o bit for 1, "temos" 111


#leitura do quarto bit quando os tres primeiros sao 000
temos000:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, numero_0 #se o bit for 0 temos 0000 que eh o comando para 0
beq x0, x0, numero_1 #se o bit for 1 temos 0001 que eh o comando para 1


#leitura do quarto bit quando os tres primeiros sao 001
temos001:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, numero_2 #se o bit for 0 temos 0010 que eh o comando para 2
beq x0, x0, numero_3 #se o bit for 0 temos 0011 que eh o comando para 3


#leitura do quarto bit quando os tres primeiros sao 010
temos010:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, numero_4 #se o bit for 0 temos 0100 que eh o comando para 4
beq x0, x0, numero_5 #se o bit for 1 temos 0101 que eh o comando para 5


#leitura do quarto bit quando os tres primeiros sao 011
temos011:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, numero_6 #se o bit for 0 temos 0110 que eh o comando para 6
beq x0, x0, numero_7 #se o bit for 1 temos 0111 que eh o comando para 7


#leitura do quarto bit quando os tres primeiros sao 100
temos100:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, numero_8 #se o bit for 0 temos 1000 que eh o comando para 8
beq x0, x0, numero_9 #se o bit for 1 temos 1001 que eh o comando para 9


#leitura do quarto bit quando os tres primeiros sao 111
temos111:
lb x12, 1025(x0)
addi x12, x12, -48
beq x12, x0, temos #se o bit for 0, "temos" 1110 e nao ha comando com esse comeco, entao voltamos ao inicio
beq x0, x0, numero_clean #se o bit for 1 temos 1111 que eh o comando para limpar


#aqui temos os prints com base no display de 7 segmentos, quando queremos que um segmento acenda, ele fica em 1, se queremos apagado, em zero
numero_clean:  
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_0:
addi x10, x0, 0b111111  
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_1:
addi x10, x0, 0b110
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_2:
addi x10, x0, 0b011011
addi x11, x0, 1 
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_3:
addi x10, x0, 0b001111 
addi x11, x0, 1
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_4:
addi x10, x0, 0b100110  
addi x11, x0, 1
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_5:
addi x10, x0, 0b101101  
addi x11, x0, 1
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_6:
addi x10, x0, 0b111101  
addi x11, x0, 1
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_7:
addi x10, x0, 0b111  
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos

numero_8:
addi x10, x0, 0b111111  
addi x11, x0, 1
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos


numero_9:
addi x10, x0, 0b101111
addi x11, x0, 1
sb x10, 1029(x0)
sb x11, 1027(x0)
beq x0, x0, temos


