.data
    ival:   .word 10
    jval:   .word 20
    g:      .word 100
    h:      .word 200
    fval:   .word 0

.text
.globl main

main:
    lw  $t1, g
    lw  $t2, h
    lw  $t3, ival
    lw  $t4, jval

    bne $t3, $t4, false
    add $t0, $t1, $t2
    j endif

false:
    sub $t0, $t1, $t2

endif:
    sw $t0, fval

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall