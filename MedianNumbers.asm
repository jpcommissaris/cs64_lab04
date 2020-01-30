# MedianNumbers.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
# Julian Commissaris & Rick Han

.data

	str1: .asciiz "Enter the next number:\n"
	str2: .asciiz "Median: "

.text

main:
	# print "enter a number" 
	li $v0, 4
	la $a0, str1
	syscall

	# get int
	li $v0, 5
	syscall
	move $t0, $v0

	# print "enter a number" 
	li $v0, 4
	la $a0, str1
	syscall

	# get int
	li $v0, 5
	syscall
	move $t1, $v0

	# print "enter a number" 
	li $v0, 4
	la $a0, str1
	syscall

	# get int
	li $v0, 5
	syscall
	move $t2, $v0

	#check 0 > 1
	bgt $t0, $t1, bigger
	# if 1 > 0 
	bgt $t0, $t2, return0
	bgt $t1, $t2, return2
	j return1


# if 0 > 1
bigger:
	bgt $t1, $t2, return1
	bgt $t0, $t2, return2
	j return0  

return0:
	move $t4, $t0
	j exit 
return1:
	move $t4, $t1
	j exit 
return2:
	move $t4, $t2
	j exit 


exit:

	# print "median" 
	li $v0, 4
	la $a0, str2
	syscall

	# print ans
	li $v0, 1
	move $a0, $t4
	syscall

	# Exit
	li $v0, 10
	syscall

