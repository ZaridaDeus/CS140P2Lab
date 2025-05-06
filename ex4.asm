.data
    A:      .word 1,2,3,4,5
    N:      .word 5
    sum:    .word 0
.text
.globl main

main:
    
    la  $t0, A          # $t0: The starting address of array A
    lw  $t1, sum
    lw  $t2, N
    ori $t3, $zero, 0
    ori $t4, $zero, 1

    ori $t7, $t0, 0
loop:
    lw  $t7, 0($t7)
    add $t1, $t1, $t7
    
    add $t3, $t3, $t4
    sll $t7, $t3, 2
    add $t7, $t7, $t0
    bne $t3, $t2, loop

    li  $v0, 1              
    move $a0, $t1
    syscall

    li  $v0, 10
    syscall


