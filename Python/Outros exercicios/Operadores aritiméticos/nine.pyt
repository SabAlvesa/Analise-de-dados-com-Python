preco = float(input("Digite o preço do produto: "))

desconto = preco * 0.05

preco_final  = preco - desconto

print(f"Seu produto com 5% de desconto fica: {preco_final} (R$)")