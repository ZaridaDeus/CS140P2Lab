.data
    A:      .word 1,2,3,4,5,6,7,8,9,10   # int A[10] = ...;
    sum:    .word 0         # sum = 0;
    N:      .word 10        # N = 10;
    i:      .word 0         # i = 0;

.text
.globl main

main:
    la  $t0, A              # Point address to A
    lw  $t1, i              # $t1 = i;
    lw  $t2, N              # $t2 = N;
    lw  $t3, sum            # $t3 = sum;

loop:
    # bge $t1, $t2, exit      if (i >= 10), go to exit

    slt $t4, $t1, $t2       # if (i < 10) $t4 = 1 or 0
    beq $t4, $zero, exit    # if ($t4 >= 0) go to exit

    # mul $t4, $t1, 4         Offset i * 4 since int is 4 bytes
    sll $t4, $t1, 2         # $t4 = i*4;
    add $t4, $t0, $t4       # Point to address of A[i] and the Offset
    lw  $t5, 0($t4)         # We load A[i] into $t5

    add $t3, $t3, $t5       # Sum += A[i];

    addi $t1, $t1, 1        # i += 1;
    j loop

exit:
    sw  $t3, sum

    li  $v0, 1
    move $a0, $t3
    syscall

    li  $v0, 10
    syscall