
dicionario_produtos = {} 

for i in range(3): 

    nome = input("Digite o nome do produto: ") 

    quantidade = int(input("Digite a quantidade: ")) 

    dicionario_produtos[nome] = quantidade 

print(f"Dicionário de produtos: {dicionario_produtos}") 