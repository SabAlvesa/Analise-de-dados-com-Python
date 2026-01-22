
v = float(input("Qual a velocidade atual do carro? "))


if v > 80:
    print("MULTADO: você será multado. Execeu o limite permitido de 80Km/h")
    multa = (v - 80 ) * 7
    print(f"Você deve pagar uma multa de: {multa: .1f}")
print ("Tenha um bom dia! Dirija com segurança")
