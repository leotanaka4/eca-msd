import math

def calcular_raizes(a, b, c):
    # Calcula o discriminante
    discriminante = (b**2) - (4*a*c)

    # Calcula as raízes
    raiz1 = (-b + math.sqrt(discriminante)) / (2*a)
    raiz2 = (-b - math.sqrt(discriminante)) / (2*a)

    # Retorna as raízes
    return raiz1, raiz2

# Definindo as constantes do sistema
Ra = 12.222223261373172
La = 0.82 * 10**(-3)
Jeq = 22.07136 * 10**(-6)
Km = 0.05048676538284488
Ke = 0.05048676538284488

# Exemplo de uso
a = La*Jeq/Km/Ke  # Coeficiente do termo de grau 2
b = Ra*Jeq/Km/Ke # Coeficiente do termo de grau 1
c = 1  # Coeficiente do termo independente

raiz1, raiz2 = calcular_raizes(a, b, c)

# Imprime as raízes
print("Raiz 1:", raiz1)
print("Raiz 2:", raiz2)

print("K:", 1/Ke)

print("Tau 1:", -1/raiz1)
print("Tau 2:", -1/raiz2)