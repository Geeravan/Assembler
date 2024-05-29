.data
	
	string: .asciiz "Type a String>"
	input: .space 20
	string2: .asciiz "Type 1 for toupper or 2 for tolower>"
	string3: .asciiz "Input>"
	string4: .asciiz "Output>"
	
.text


	li $v0, 4
	la $a0, string
	syscall

	li $v0, 8
	la $a0, input
	li $a1, 20
	syscall
	
	li $v0, 4
	la $a0, string2
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $v0, 4
	la $a0 string3
	syscall
	
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 4
	la $a0, string4
	syscall 
	
	la $t0, input
	
	beq $t2, 1, toupper
	beq $t2, 2, tolower
	
toupper:

	lb $t1, 0($t0)
	beq $t1, $zero, end
	
	blt $t1, 97, next_char1
	bgt $t1, 124, next_char1
	
	sub $t1, $t1, 32
	
	sb $t1, 0($t0)
	
	j toupper

tolower:

	lb $t1, 0($t0)
	beq $t1, $zero, end
	
	blt $t1, 65, next_char2
	bgt $t1, 90, next_char2
	
	addi $t1, $t1, 32
	
	sb $t1, 0($t0)
	
	j tolower

next_char1:

	addi $t0, $t0, 1
	j toupper
	
next_char2:
	addi $t0, $t0, 1
	j tolower

end:

	li $v0, 4
	la $a0, input
	syscall
