.data
array:   .word 10, 324, 45, 90, 9808
message:  .asciiz "Largest in given array is "


.text
.globl main

main:
la $s1,array
li $s2,5
lw $t0,0($s1)
addi $t1,$zero,0

loop:
add $t1,$t1,1
beq $t1,$s2,done
add $t2,$t1,$t1
add $t2,$t2,$t2
add $t2,$t2,$s1
lw $t3,0($t2)
slt $t4,$t0,$t3
beq $t4,$zero,loop
addi $t0,$t3,0
j loop
done: 
li $v0,4
la $a0, message
syscall
add $a0,$zero,$t0
li $v0,1
syscall
li $v0,5
syscall

