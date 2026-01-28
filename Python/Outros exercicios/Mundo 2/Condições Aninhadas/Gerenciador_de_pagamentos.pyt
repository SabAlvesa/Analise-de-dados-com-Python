print("=== LOJÃO DA BIA ===")

preco = float(input("Preço das compras: R$"))
print('''FORMAS DE PAGAMENTO
      [1] à vista dinheiro/cheque
      [2] à vista cartão
      [3] 2x no cartão
      [4] 3x ou mais no cartão''')

opcao = int(input("Qual é a opção? "))

if opcao ==1:
    total = preco - (preco * 10/ 100)
elif opcao ==2:
    total = preco - (preco * 5/100)
elif opcao ==3:
    total = preco
    parcela = total /2
    print("Sua compra será parcela em 2x de", parcela)
elif opcao ==4:
    total = preco + (preco * 20/ 100)
    totparc = int(input("Quantas parecelas? "))
    parcela = total /totparc
    print("Sua compra será parcela em", totparc, "x", "com juros de", parcela)
else: 
    total = 0
    print("Opção de pagamento inválida! Tente novamente.")
print("Sua compra de",preco, "vai custar", total)
