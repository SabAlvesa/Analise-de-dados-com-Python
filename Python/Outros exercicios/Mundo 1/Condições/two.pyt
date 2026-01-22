n1 = float(input("Digite a primeira nota: "))
n2 = float(input("Digite a segunda nota: "))
n3 = float(input("Digite a terceira nota: "))

media = (n1 + n2 + n3) / 3

print(f"Sua média é: {media:.1f}")

if media >= 6.0:
    print("Sua média foi boa! Parabéns")
else:
    print("Sua média não foi o suficiente :/")