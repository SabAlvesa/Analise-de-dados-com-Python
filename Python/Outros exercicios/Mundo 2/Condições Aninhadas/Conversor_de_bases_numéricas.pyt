n = int(input("Digite um número inteiro: "))
print('''Escolha uma das bases para a conversão: 
[1] converter para BINÁRIO"))
[2] converter para OCTAL"))
[3] converter para HEXADECIMAL''')
opcao = int(input('Sua opção: '))

if opcao == 1:
    print(n, "Convertido para BINÁRIO é igual a", (bin(n)))   
elif opcao == 2 :
    print(n, "Convertido para OCTALé igual a", (oct(n)))
elif opcao == 3:
    print(n, "Convertido para HEXADECIMAL é igual a", (hex(n)))
else:
    print("Opção inválida. Tente novamente")