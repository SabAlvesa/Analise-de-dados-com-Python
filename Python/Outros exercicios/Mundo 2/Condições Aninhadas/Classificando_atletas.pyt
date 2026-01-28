from datetime import date
atual = date.today().year
ano = int(input("Digite o ano de nascimento: "))
idade = atual - ano

print("O atelta tem", ano, "tem", idade, "anos.")

if idade <= 9:
    print("Classificação: MIRIM")
elif idade <= 14:
    print("Classificação: INFANTIL")
elif idade <= 19:
    print("Classificação: JUNIOR")
elif idade <= 25:
    print("Classificação: SÊNIOR")
else:
    print("Classificação: MASTER")
