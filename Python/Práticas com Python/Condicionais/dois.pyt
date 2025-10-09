DiasA = int(input("Digite os dias para a atividade A: "))
DiasB = int(input("Digite os dias para a atividade B: "))
DiasC = int(input("Digite os dias para a atividade C: "))
 


if (DiasA > 0 and DiasB > 0 and DiasC > 0):
    tempoP = DiasA + DiasB + DiasC
    print("O tempo total é de:", tempoP)
else:
    print("Erro: Os dias não podem ser negativos")