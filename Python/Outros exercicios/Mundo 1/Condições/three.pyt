from random import randint
computador = randint(0,5) # sortear um número de 0 a 5

print("Vou pensar em um número de 0 a 5. Tente Adivinhar...")
n = int(input("Que número eu pensei?: "))



if n == computador:
    print("Parabéns! Você acertou!")
else:
    print("Não foi dessa vez, eu pensei no número", computador, "e não no número", n)