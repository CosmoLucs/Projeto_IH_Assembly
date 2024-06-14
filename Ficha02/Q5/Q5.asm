    lb x11, 0(x0)
    sb x11, 1030(x0)
    lb x5, 0(x0)
    lb x6, 0(x0)
    lb x7, 0(x0)
    lb x28, 0(x0)
    lb x29, 0(x0)
    lb x30, 0(x0)
    lb x31, 0(x0)
    lb x9, 0(x0)
    lb x18, 0(x0)
    lb x19, 0(x0)
    lb x20, 0(x0)
    lb x21, 0(x0)
    lb x22, 0(x0)

    addi x5, x5, 327
    addi x6, x6, 429
    addi x7, x7, 531
    addi x28, x28, 634
    addi x29, x29, 736

    addi x9, x9, 1
    addi x18, x18, 2
    addi x19, x19, 4
    addi x20, x20, 8
    addi x21, x21, 16
    addi x22, x22, 32

    lh x11, 1031(x0)

    blt x11, x5, yl 
    blt x11, x6, gl 
    blt x11, x7, gr 
    blt x11, x28, yr 
    blt x11, x29, rr 
    bge x11, x29, rl 

yl:
    sb x9, 1027(x0)
    beq x0, x0, fim

gl:
    sb x18, 1027(x0)
    beq x0, x0, fim

gr:
    sb x19, 1027(x0)
    beq x0, x0, fim

yr:
    sb x20, 1027(x0)
    beq x0, x0, fim

rr:
    sb x21, 1027(x0)
    beq x0, x0, fim

rl:
    sb x22, 1027(x0)
    beq x0, x0, fim

fim:
    halt
