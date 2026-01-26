n1 = float(input("Digite a primeira nota: "))
n2 = float(input("Digite a segunda nota: "))

nf = (n1 + n2)/ 2

if  6 > nf >=5:
    print("Sua nota foi", nf, "Você está de recuperação.")
elif nf <= 5:
    print("Infelizmente sua nota foi", nf, "Você está reprovado.")
else:
    print("Parabens!! Você está aprovado")