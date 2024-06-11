
# Letras           Valor
# A, E, I, O, U      3
# D, G, T            1
# B, C, M, N, P      4
# F, H, V, W, Y      2
# K, R, S            5
# J, L, X            8
# Q, Z               6

# Formato da entrada:
# "PALAVRA1" + " " + "PALAVRA2" + " "

# Carrega pontuação do alfabeto
# como array na memoria
# //  gostaria de tentar fazer isso 
# //  com pipeline depois (TODO?)

addi t0, x0, 3
addi t1, x0, 1
addi t2, x0, 4
addi t3, x0, 2
addi t4, x0, 5
addi t5, x0, 8
addi t6, x0, 6

sb t0, 0(x0)  # A
sb t0, 4(x0)  # E
sb t0, 8(x0)  # I
sb t0, 14(x0) # O
sb t0, 20(x0) # U

sb t1, 6(x0)  # G
sb t1, 3(x0)  # D
sb t1, 19(x0) # T

sb t2, 1(x0)  # B
sb t2, 2(x0)  # C
sb t2, 12(x0) # M
sb t2, 13(x0) # N
sb t2, 15(x0) # P

sb t3, 5(x0)  # F
sb t3, 7(x0)  # H
sb t3, 21(x0) # V
sb t3, 22(x0) # W
sb t3, 24(x0) # Y

sb t4, 10(x0) # K
sb t4, 17(x0) # R
sb t4, 18(x0) # S

sb t5, 9(x0)  # J
sb t5, 11(x0) # L
sb t5, 23(x0) # X

sb t6, 16(x0) # Q
sb t6, 25(x0) # Z

#constantes globais:
addi s3, x0, 65 # 'A'
addi s4, x0, 32 # ' '

# salva player 1
jal ra, recebe
addi s1, a1, 0

# salva player 2
jal ra, recebe
addi s2, a1, 0

sb s4, 1024(x0) # espaco estetico

# verifica quem ganhou
bne s1, s2, naoempatou
	addi t0, x0, 69		# E (empate)
	jal x0, exit
naoempatou:
blt s1, s2, playerdois
	addi t0, x0, 49		# 1 (1 venceu)
	jal x0, exit
playerdois:
	addi t0, x0, 50		# 2 (2 venceu)
exit:

sb t0, 1024(x0) # escreve resultado

# le fin
halt 

# funcao recebe:
recebe:
addi a1, x0, 0
laco:
	lb t0, 1025(x0)
	beq t0, s4, fim #if(t0 == ' ')break;

	sub t0, t0, s3
	lb t0, 0(t0)
	add a1, a1, t0

	jal x0, laco
fim:
jalr x0, 0(ra)
