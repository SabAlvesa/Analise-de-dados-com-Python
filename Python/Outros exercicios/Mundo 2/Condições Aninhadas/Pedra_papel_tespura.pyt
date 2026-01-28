
from random import randint
print("=== GAME ===")
itens = ('Pedra', 'Papel', 'Tesoura')
computador = randint (0,2)

opcao = int(input('''         
[0] Pedra
[1] Papel
[2] Tesoura
      
Qual é a sua opção? '''))

print("++++++++")      
print("Jogador jogou", (itens[opcao]))
print("O computador escolheu:", (itens[computador]))
print("++++++++")

if computador ==0:
    if opcao == 0:
        print("Empate!")
    elif opcao == 1:
        print("Jogador vence!")
    elif opcao ==2:
        print("Computador vence!")
    else:
        print("Jogada inválida!")
        
elif computador ==1:
    if opcao == 0:
        print("Computador vence!")
    elif opcao == 1:
        print("Empate!")
    elif opcao ==2:
        print("Jogador vence!")
    else:
        print("Jogada inválida!")
    
elif computador ==2:
    if opcao == 0:
        print("Jogador vence!")
    elif opcao== 1:
        print("Computador vence!")
    elif opcao ==2:
        print("Empate!")
    else:
        print("Jogada inválida!")