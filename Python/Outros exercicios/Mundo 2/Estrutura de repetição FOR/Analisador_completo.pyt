somaidade =0 
mediaidade = 0
maioridadehomem = 0
nomevelho = ''
totmulher20 = 0

for i in range(1,5):
    print("============")
    nome = (input("Nome: ")).strip()
    idade = int(input("Idade: "))
    sexo = (input("[M/F/ Others]")).strip()
    somaidade += idade
    
    if i == 1 and sexo in 'Mn':
        maioridadehomem = idade
        nomevelho = nome
    if sexo in 'Mm' and idade > maioridadehomem:
        maioridadehomem = idade
        nomevelho = nome
    if sexo in 'Ff' and idade   > 20:
         totmulher20 +=1

mediaidade = somaidade /4
print("A média de idade do grupo é de", mediaidade)
print("O homem mais velho tem", maioridadehomem, "E se chama", nomevelho)
print("Ao todo são", totmulher20, "mulher com menos de 20 anos.")
