
def criar_desconto(porcentagem):  

   def calcular_preco(valor):  

       return valor - (valor * (porcentagem / 100))  

   return calcular_preco 

desconto = float(input("Digite a porcentagem de desconto: "))  

calcular_preco_final = criar_desconto(desconto) 

valor = float(input("Digite o valor da compra: "))  

print(f"Preço final com desconto: {calcular_preco_final(valor)}") 