.data

zahl: .asciiz "Geben Sie eine Zahl ein zum Wurzelziehen"
floats: .float 0.0 , 0.5, 1.0, 2.0
case: .asciiz "wie oft soll das verfahren wiederholt werden"


.text


	li $v0, 4
	la $a0, zahl
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	
	li $v0, 2
	mov.s $f12, $f1
	syscall
	
	la $a0, floats
	
	lwc1 $f3, 0($a0)	# f3 = 0
	lwc1 $f4, 4($a0)	# f4 = 0.5
	lwc1 $f5, 8($a0)	# f5 = 1
	lwc1 $f6, 12($a0)	# f6 = 2
	
	add.s $f7, $f7, $f3
	

	add.s $f7, $f1, $f5
	mul.s $f7, $f7, $f4

heron:
	
	div.s $f8, $f1, $f7
	add.s $f7, $f7, $f8
	mul.s $f7, $f7, $f4
	
