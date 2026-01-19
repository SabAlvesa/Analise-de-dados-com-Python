
estoque = { 

    "Caderno universitário": 50, 

    "Caneta azul": 120, 

    "Borracha branca": 30 

} 

produto = input("Digite o nome do produto a ser atualizado: ") 

nova_quantidade = int(input("Digite a nova quantidade: ")) 

if produto in estoque: 

    estoque[produto] = nova_quantidade 

    print("Quantidade atualizada com sucesso!") 

    print(estoque) 

else: 

    print("Produto não encontrado no estoque.") 