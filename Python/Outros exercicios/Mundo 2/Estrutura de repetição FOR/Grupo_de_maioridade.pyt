from datetime import date
atual = date.today().year
totmaior = 0
totmenor = 0
for pess in range(1,7+1):
    ano = int(input("Em que ano a pessoa nasceu?: "))
    idade = atual - ano
    if idade >=21:
        totmaior +=1
        print("Essa pessoa é maior de idade. ")
    else:
        totmenor +=1
        print("Essa pessoa é menor de idade.")
print("Temos", totmaior, "Maiores de idade. E", totmenor, "Menores de idade.")