print("Bem- vindo(a) a simulação de crédito do Banco ExP.")
valor = float(input("Digite o valor do financiamento: "))
salario = float(input("Digite o valor do seu salário bruto(antes dos descontos): "))
anos = int(input("Estimativa do tempo de pagamento (em anos): "))

minimo = salario *0.30
prestacao = (valor / (anos*12)) 
print('Para pagar uma casa de', valor, 'em', anos, 'anos')
print('A prestação será de R$', prestacao)


if prestacao <= minimo:
    print("O empréstimo pode ser concedido.")   
else:
    print("O valor do financiamento ultrapassou os 30% do seu salário, o empréstimo foi negado.")
