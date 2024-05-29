.data
input: .space 20
eingabe: .asciiz "Eingabe>"
schluessel: .asciiz "Schluessel>"
textm: .asciiz "Verschluesselter Text:"
.text

#String1  ausgeben
li $v0, 4
la $a0, eingabe
syscall
#Eingabe eingeben
li $v0, 8
la $a0 , input
li $a1, 20
syscall

# string2 ausgeben
li $v0, 4
la $a0, schluessel
syscall

#Wert vom schluessel ausgeben
li $v0, 5
syscall
move $t2, $v0

#Addresse laden
la $t0, input

#schleife
loop:

lb $t1, 0($t0)
beq $t1, $zero, end
add $t1,$t1, $t2
sb $t1, 0($t0)
addi $t0, $t0, 1
j loop

#Endbedingung
end: 
li $v0, 4
la $a0, input
syscall