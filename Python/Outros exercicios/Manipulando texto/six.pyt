frase = input("Digite uma frase: ").upper()

letraA = frase.count('A')
print('A letra A aparece', letraA, "vezes")

PLetra = frase.find('A')+1
print('A primeira letra A apareceu na posição', PLetra)

Uletra = frase.rfind('A')+1
print('A última letra A apareceu na posição', Uletra)