lw x12, val
lw x13, val2

and x11, x11, x12 #zera o bit 31 ate ao 24 de x11
and x13, x13, x10 #coloca em x13 o valor dos bit 15 ao 8 de x10

slli x13, x13, 16 #shift left para colocar os bit de x13 na posicao 31 a 24

or x11, x11, x13  #passa os bits de x13 para x11


val: .word 0xffffff  #valor 0000 0000 1111 1111 1111 1111 1111 1111 em hex
val2: .word 0xff00   #valor 0000 0000 0000 0000 1111 1111 0000 0000 em hex
