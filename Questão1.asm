#carrega da memoria
lw x5, a
lw x6, b
lw x7, m

add x7, x0, x5 #m = a

beq x6, x7, Equal #if(b == m) goto Equal
sub x7, x5, x6 #if(b != m) m = a-b
beq x0, x0, Exit #goto Exit

Equal:
	sub x7, x6, x5			#m = b-a
 
#salva na memoria 
Exit:	 
	sw x5, a
	sw x6, b
	sw x7, m

a: .word 15		#int a = 
b: .word 7	#int b = 
m: .word 0		#int m = 

