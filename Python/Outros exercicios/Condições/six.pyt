d = float(input("Digite a distância da viagem? "))

if d <= 200:
    preco = d * 0.50
else:
    preco = d * 0.45
    
print(f"O preço da sua passagem será de {preco:.2f}R$")
