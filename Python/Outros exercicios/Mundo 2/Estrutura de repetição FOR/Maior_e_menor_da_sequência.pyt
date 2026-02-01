maior = 0
menor = 0
for p in range(1,6):
    peso = float(input("Peso: "))
    if p ==1:
        maior = p
        menor = p
    else:
        if peso > maior:
            maior = peso
            if peso < menor:
                menor = peso
print("O maior peso lido foi de", maior)
print("O menor peso lido foi de: ", menor)