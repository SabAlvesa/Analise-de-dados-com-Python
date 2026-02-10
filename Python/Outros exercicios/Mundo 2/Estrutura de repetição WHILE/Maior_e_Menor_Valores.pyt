soma = q = m = maior = menor= 0
r = 'S'
while r in 'Ss':
    n = int(input("Digite um número: "))
    soma += n
    q +=1
    if q ==1:
        maior = menor = n
    else: 
        if n > maior:
            maior = n
        if n < menor:
            menor = n
    r = input("Quer continuar? ").upper().strip()[0]
m = soma /q
print('Você digitou', q, "núemros, e a média foi:", m)
print('O maior valor foi:', maior, "e o menor foi", menor)