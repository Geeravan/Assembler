.data

string1: .asciiz "Type a String> "
string2: .asciiz "Type a Char> "
string3: .asciiz  "\n occurence(s)>"
input: .space 100
input2: .space 2

string4: .asciiz "Soll das Programm nochmal "

.text

 	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 8
	la $a0, input
	li $a1, 100
	syscall
	
	li $v0, 4
	la $a0, string2
	syscall
	
	li $v0, 8
	la $a0, input2
	li $a1, 2
	syscall
 
   	la $t1, input2   
    	lb $t2, 0($t1)

	la $t0, input
	li $t3, 0
	
loop:
	lb $t4, 0($t0)
	
	beq $t4, $zero, end
	beq $t4, $t2, counter

	addi $t0, $t0, 1
	
	j loop

counter:
	addi $t3, $t3, 1
	addi $t0, $t0, 1
	j loop																
																											
end:
	li $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0, string3
	syscall


