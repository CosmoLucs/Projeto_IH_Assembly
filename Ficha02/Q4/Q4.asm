# salva valores na memoria
addi x5, x0, 1
addi x6, x0, 2
addi x7, x0, 6
addi x28, x0, 24
addi x29, x0, 120
addi x30, x0, 720 # numero n cabe no addi vvv
 slli x31, x30, 3 # * 7
 sub x31, x31, x30
slli x16, x31, 3  # * 8
 slli x17, x16, 3 # * 9
 add x17, x17, x16
sw x5, 0(x0)
sw x5, 4(x0)
sw x6, 8(x0)
sw x7, 12(x0)
sw x28, 16(x0)
sw x29, 20(x0)
sw x30, 24(x0)
sw x31, 28(x0)
sw x16, 32(x0)
sw x17, 36(x0)

# recebe algarismos e soma em x8
addi x8, x0, 0
addi x9, x0, 48 #'0'
recebe:
    lb x5, 1025(x0)
    beq x5, x0, recebe_fim

    sub x5, x5, x9
    slli x5, x5, 2
    lw x5, 0(x5)
    add x8, x8, x5

    jal x0, recebe
recebe_fim:

addi x5, x0, 32
sb x5, 1024(x0)

# printa resultado
# 5 * 9! == 1814400 == 0x1baf80
# para decimal precisamos de 7 algs

lw x28, a6
sw x28, 0(x0)
lw x28, a5
sw x28, 4(x0)
lw x28, a4
sw x28, 8(x0)
lw x28, a3
sw x28, 12(x0)
lw x28, a2
sw x28, 16(x0)
lw x28, a1
sw x28, 20(x0)
lw x28, a0
sw x28, 24(x0)

addi x7, x0, 0
addi x29, x0, 7
addi x30, x0, 1
add x5, x8, x0 

laco1:
    add x6, x9, x0
    slli x31, x7, 2
    lw x28, 0(x31)
    laco2:
        sub x5, x5, x28 
        addi x6, x6, 1
        bge x5, x0, laco2
    sub x6, x6, x30
    sb x6, 1024(x0)
    add x5, x5, x28

    addi x7, x7, 1
    blt x7, x29, laco1


halt

a6: .word 1000000
a5: .word 100000
a4: .word 10000
a3: .word 1000
a2: .word 100
a1: .word 10
a0: .word 1