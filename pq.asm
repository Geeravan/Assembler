.data
# Konstanten
floats:	.float 0.0, 0.5, 1.0 # 4097 ($a0)
info0:	.asciiz "Programm zur Loesung quad. Gleichung: a0 + a1*x + a2*x**2 = 0.\n"
info1:	.asciiz "Eingabe a0: \t"
info2: 	.asciiz "Eingabe a1: \t"
info3:	.asciiz "Eingabe a2: \t"
info4:	.asciiz	"Ergebnis: \t"
infoab:	.asciiz "Koeffizient a2 darf nicht Null sein! Ende. \n"


.text
	li $v0, 4
	la $a0, info0
	syscall
	
	li $v0, 4
	la $a0, info1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	li $v0, 4
	la $a0, info2
	syscall
	
	li $v0, 6
	syscall
	mov.s $f3, $f0
	
	li $v0, 4
	la $a0, info3
	syscall
	
	li $v0, 6
	syscall
	mov.s  $f4, $f0
	
	la $a0, floats
	lwc1 $f5, 0($a0)
	
	c.eq.s  $f5, $f4
	bc1t printfalse
	
	
	lwc1 $f6, 4($a0)	# f5 = 0.0 f6 = 0.5 f7= 1.0 	
	lwc1 $f7, 8($a0)	# a2 = x a1 = p a0 = q
	
	div.s $f8, $f2, $f4	#p
	div.s $f9, $f3, $f4	#q
	
	mul.s $f10, $f8, $f6
	mul.s $f10, $f10, $f10
	sub.s $f10, $f10, $f9
	
	c.eq.s $f10, $f5
	bc1t printsimple
	jal sqrt
	
	
	
printsimple:
	mul.s $f8, $f8, $f6
	neg.s $f8, $f8
	
	li $v0, 4
	la $a0, info4
	syscall
	
	li $v0, 2
	mov.s $f12, $f8
	syscall
	
	j end
		
printfalse:
	li $v0, 4
	la $a0, infoab
	syscall
	
	j end	
	
	
	
	
	
sqrt:
	
	
	
	
	
end:
	li $v0, 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	#li $v0, 2
	#mov.s $f12, $f2
	#syscall
	
	#li $v0, 2
	#mov.s $f12, $f3
	#syscall
	
	#li $v0, 2
	#mov.s $f12, $f4
	#syscall

	
	
	