from datetime import date
atual = date.today().year
ano = int(input("Digite o ano de nascimento: "))
idade = atual - ano

print("Quem nasceu em", ano, "tem", idade, "anos.")

if idade == 18:
    print("Você já deve se alistar!")
elif idade < 18:
    saldo = 18 - idade
    ano = atual + saldo
    print("Você ainda não tem 18 anos, ainda faltam", saldo, "anos para o seu alistamento. Seu alistamento vai ser em", ano)
elif idade >18:
    saldo = idade - 18
    ano = atual - saldo
    print("Você ja deveria ter se alistado há", saldo, "anos. Seu alistamento deveria ter sido em:",ano )