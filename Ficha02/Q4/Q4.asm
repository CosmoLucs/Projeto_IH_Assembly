4:
# salva valores na memoria
addi x5, x0, 1
sw x5, 0(x0)
addi x5, x0, 1
sw x5, 4(x0)
addi x5, x0, 2
sw x5, 8(x0)
addi x5, x0, 6
sw x5, 12(x0)
addi x5, x0, 24
sw x5, 16(x0)
addi x5, x0, 120
sw x5, 20(x0)
addi x5, x0, 720
sw x5, 24(x0)
addi x5, x0, 5040
sw x5, 28(x0)
addi x5, x0, 40320
sw x5, 32(x0)
addi x5, x0, 362880
sw x5, 36(x0)

# recebe algarismos e soma
addi x6, x0, 0
addi x7, x0, 48
recebe:
    lb x5, 1025(x0)
    beq x5, x0, recebe_fim

    sub x5, x5, x7
    slli x5, x5, 2
    lw x5, 0(x5)

    add x6, x6, x5

    jal x0, recebe
recebe_fim:




halt
# TODO printa resultado