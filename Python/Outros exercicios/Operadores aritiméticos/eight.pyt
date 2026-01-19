altura = int(input("Digite a altura da sua parede (m)"))
largura = int(input("Digite a largura da sua parede(m)"))

areaTotal = altura * largura
latas = areaTotal / 2

print("-" * 40)
print(f"Área Total da Parede: {areaTotal:.2f} m²")
print(f"Latas Necessárias (Cálculo Exato): {latas:.2f} latas")
