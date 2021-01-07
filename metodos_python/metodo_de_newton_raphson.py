# Exemplo usado: x^3-x-1 = 0

import matplotlib.pyplot as plt
import math

def newton_raphson ():

    n = 0
    chute_inicial = 0
    x = []
    x.append(chute_inicial)
    
    while True:
        x.append (round (funcao_g(x[n]), 16))
        n += 1
        print (f'x{n}: {x[n]:<20.16f}  Erro: {abs(x[n]-x[n-1]):<20.16f}')

        if x[n] == x[n-1]:
            print (f'A soluçaõ convergiu corretamente na interação {n}')
            print (f'Ponto fixo da equação: {x[n]:<20.16f}')
            break;

    i = [i for i in range (1, len(x))]
    x.pop (0)

    plt.title ("Método de Newton-Rapshon")
    plt.xlabel ("Eixo X")
    plt.ylabel ("Eixto Y")
    plt.plot (i, x)
    plt.show ()
    
def funcao_g (x):
    return round (x - (funcao(x)/derivada(x)), 16)

def funcao (x):
    return round (x**3-x-1, 16)

def derivada (x):
    return round (3*x**2-1, 16)

if __name__ == "__main__":
    newton_raphson ()
    