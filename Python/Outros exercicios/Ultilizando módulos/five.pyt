import math

angulo = float(input("Digite o valor do ângulo: "))

print(angulo)

radianoAngulo = math.radians(angulo)
print(f"O seno:  {math.sin(radianoAngulo):.4f} O cosseno: {math.cos(radianoAngulo):.4f} a Tangente: {math.tan(radianoAngulo):.4f}")