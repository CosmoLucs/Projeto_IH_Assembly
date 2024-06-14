  #Configuração da pinagem do arduino:
  #A0 na temperatura do sensor
  #Leds do DigitalWrite:
  # 8 para a led amarela esquerda
  # 9 para a led verde esquerda
  # 10 para a led verde direita
  # 11 para a led amarela direita
  # 12 para a led direita vermelha
  # 13 para a led esquerda vermelha

  #qual porta vai escolher o sensor analogico e inicialização dos registradores
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
    
  addi x5, x5, 327 // 327 representa 16 no sensor de temperatura
  addi x6, x6, 429 //429 representa 21 no sensor de temperatura
  addi x7, x7, 531 //531 representa 26 no sensor de temperatura
  addi x28, x28, 634//634 representa 31 no sensor de temperatura
  addi x29, x29, 736//736 representa 36 no sensor de temperatura

  #numeros para ligar somente uma led
  addi x9, x9, 1 #led amarela esquerda
  addi x18, x18, 2 #led verde esquerda
  addi x19, x19, 4 #led verde direita
  addi x20, x20, 8 #led amarela direita
  addi x21, x21, 16 # led vermelha direita
  addi x22, x22, 32 #led vermelha esquerda


  lh x11, 1031(x0) #ler numero do sensor
 
  blt x11, x5, yl #se for menor que 16 vai para yl (yellow left)
  blt x11, x6, gl #se for menor que 21 vai para gl (green light)
  blt x11, x7, gr #se for menor que 26 vai para gr (green right)
  blt x11, x28, yr #se for menor que 31 vai para yr (yellow right)
  blt x11, x29, rr #se for menor que 36 vai para rr (red right)
  bge x11, x29, rl #se for maior ou igual que 36 vai para rl (red left)

yl:
    sb x9, 1027(x0) #acender a led amarela esquerda
    beq x0, x0, fim 

gl:
    sb x18, 1027(x0) #acender a led verde esquerda
    beq x0, x0, fim
gr:
    sb x19, 1027(x0) #acender a led verde direita
    beq x0, x0, fim

yr:
    sb x20, 1027(x0) #acender a led amarela direita
    beq x0, x0, fim

rr:
    sb x21, 1027(x0) #acender a led vermelha direita
    beq x0, x0, fim

rl:
    sb x22, 1027(x0) ##acender a led vermelha esquerda
    beq x0, x0, fim
fim:
    halt
