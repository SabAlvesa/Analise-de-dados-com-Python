from random import randint
computador = randint(0,10)
palpites = 0
acertou = False
while not acertou:
    jogador = int(input("Qual é o seu palpite?: "))
    palpites += 1
    if jogador == computador:
        acertou = True
        
print("Acertou com", palpites, 'palpites')