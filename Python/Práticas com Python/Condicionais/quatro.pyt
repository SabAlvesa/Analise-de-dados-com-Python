peso = int(input("Digite seu peso(kg):"))
altura = int(input("Digite sua altura(m):"))

IMC = peso / (altura ** 2)

if IMC < 18.5:
    print("O seu IMC é:", IMC, "sendo considerado abaixo do peso")
elif  (18.5 <= IMC < 25):
    print("O seu IMC é", IMC, "sendo considerado o pedo normsl")
elif (IMC >= 25):
    print("O seu IMC é:", IMC, "sendo considerado Acima do peso")



