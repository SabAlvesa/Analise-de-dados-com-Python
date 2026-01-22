r1 = float(input("Digte a 1° reta: "))
r2 = float(input("Digte a 2° reta: "))
r3 = float(input("Digte a 3° reta: "))

if r1<r2 + r3 and r2<r1 + r3 and r3<r1 + r2:
    print("Os segmentos acima podem formar um triângulo.")
    
else:
    print("Os segmentos acima não podem formar um triângulo")
    
    #para formar um triângulo a forma de dois lados sempre deve ser maior que o terceirp