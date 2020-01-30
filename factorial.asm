# Factorial.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter the number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#


.data

	str1: .asciiz "Enter a number:\n"
	str2: .asciiz "Factorial of "
	str3: .asciiz " is:\n"
	str4: .asciiz " \n"

.text

main:
	# print "enter a number" 
	li $v0, 4
	la $a0, str1
	syscall

	# get int
	li $v0, 5
	syscall
	move $t0, $v0  #t0 is the number to factorial
	move $t5, $v0
	move $t6, $v0

#check if zero
	beq $zero, $t0, set1


loop:

	sgt $t1, $t0, 2
	beq $t1, $zero, exit
	add $t0, $t0, -1

	mult $t5, $t0 
	mflo $t5 

	j loop

set1:
	li $t5, 1

exit:

	#print strs
	li $v0, 4
	la $a0, str2
	syscall

	#print strs
	li $v0, 1
	move $a0, $t6
	syscall

	li $v0, 4
	la $a0, str3
	syscall


	# print ans
	li $v0, 1
	move $a0, $t5
	syscall
	li $v0, 4
	la $a0, str4
	syscall

	# Exit
	li $v0, 10
	syscall

