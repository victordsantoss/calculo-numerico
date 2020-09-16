'''
    Método de Newton é definido por: 
        x(n+1) = x(n) - f(x(n))/f'(x(n))
    Exemplo usado: x^3-x-1 = 0
'''
import math

def newton_rapshon ():

    n = 0
    chute_inicial = 0
    x = []
    x.append(chute_inicial)

    while True:
        x.append (funcao_g(x[n]))
        n += 1
        print (f'x{n}: {x[n]:.20f} Erro: {abs(x[n]-x[n-1]):.20f}')

        if x[n] == x[n-1]:
            print (f'A soluçaõ convergiu corretamente na interação {n}')
            print (f'Ponto fixo da equação: {x[n]:.15f}')
            break;
    
def funcao_g (x):
    return x - (funcao(x)/derivada(x))

def funcao (x):
    return x**3-x-1

def derivada (x):
    return 3*x**2-1

if __name__ == "__main__":
    newton_rapshon ()
    