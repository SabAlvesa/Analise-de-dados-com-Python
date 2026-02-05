n1 = int(input("Digite o primeiro valor: "))
n2 = int(input("Digite o segundo valor: "))
opcao = 0

while opcao !=5:
    print('''[1]Somar 
    [2]multiplicar
    [3]maior
    [4]novos números
    [5]sair do programa
        ''')
    opcao = int(input("Qual é a sua opção? "))
    if opcao == 1:
        soma = n1+n2
        print("A soma entre", n1, n2, "é ", soma)
    
    elif opcao == 2:
            multiplicacao = n1 * n2
            print("A multiplicação entre", n1, n2, "é ", multiplicacao)
    elif opcao == 3:
        if n1 > n2:
            maior = n1
        else:
            maior = n2
        print("Entre", n1, n2, "o maior é", maior)
    elif opcao == 4:
        print("Informe os números novamente: ")
        n1 = int(input("Primeiro valor: "))
        n2 = int(input("Digite o segundo valor: "))
        
    elif opcao ==5: 
        print("Finalizando...")
    else:   
        print("Opção inválida. Tente novamente")
    print("=-=" * 10)
print ("Fim do programa.")