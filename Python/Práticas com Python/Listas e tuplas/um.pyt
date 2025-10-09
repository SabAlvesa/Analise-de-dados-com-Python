despensa = ["arroz", "feijão", "farinha", "sal"]

pergunta1 = str(input("Digite o item que vocÊ quer verificar: "))

if pergunta1 in despensa:
    print(f"O item {pergunta1} já está disponível na despensa.")
else:
    print(f"O item {pergunta1} precisa ser comprado.")
print(despensa)