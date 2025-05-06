.data
    ival:   .word 100       # i = 100;
    jval:   .word 200       # j = 200;
    fval:   .word 0         # f = 0;
    gval:   .word 10        # g = 10;
    hval:   .word 5         # h = 5;

.text
.globl main

main:
    lw  $t0, fval           # $t0 = f;
    lw  $t1, gval           # $t1 = g;
    lw  $t2, hval           # $t2 = h;

    lw  $t3, ival           # $t3 = i;
    lw  $t4, jval           # $t4 = j;

    slti $t5, $t3, 10        # $t5 = ($t3 < 10) false = 0, true = 1;
    beq $t5, $zero, false   # if ($t5 == 0) jump to false
    add $t0, $t1, $t2       # $t0 = $t1 + $t2
    j endif                 

false:                      # else
    # xor $t2, $t2, 0xFFFF  1's complement -> eg: 001010 > 110101
    lui $t5, 0xFFFF         # $t5 = 0xFFFFXXXX;
    ori $t5, $t5, 0xFFFF    # $t5 = 0xFFFFFFFF;
    xor $t2, $t2, $t5       # $t2 compares to $t5, to 1's complement
    addi $t2, $t2, 1        # $t2 = $t2 + 1 for 2's complement -> $t2 = -$t2;
    add $t0, $t1, $t2       # $t0 = $t1 + $t2;

endif:
    sw  $t0, fval           # f = $t0;

    li  $v0, 1              
    move $a0, $t0           # cout << f;
    syscall

    li  $v0, 10
    syscall
