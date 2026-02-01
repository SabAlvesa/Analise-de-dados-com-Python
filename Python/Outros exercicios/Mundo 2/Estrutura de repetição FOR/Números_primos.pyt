n = int(input("Digite um núnero: "))
tot = 0
for i in range (1, n+1):
    if n % i ==0:
        print('\033[34m')
        tot +=1
    else:
        print('\033[31m')
    print(i)
print("O número", n, 'é divisível', tot, 'vezes')
    
    #quais são os números primos