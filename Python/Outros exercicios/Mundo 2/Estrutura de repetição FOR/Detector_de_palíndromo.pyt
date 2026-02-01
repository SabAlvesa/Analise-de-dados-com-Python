frase = input("Digite uma frase: ").strip().upper()
palavras = frase.split()
tudojunto = ''.join(palavras)
inverso = ''
for letra in range(len(tudojunto)-1, -1, -1):
   inverso += tudojunto[letra]
if inverso == tudojunto:
    print('Temos um palíndromo')
else:
    print('A frase digitada não é um palíndromo')