'''
    Exemplo usado: x^3-x-1 = 0
'''
import matplotlib.pyplot as plt
import math
import numpy

def metodo_da_bisseccao ():

    n = 0
    nmax = 100
    tol = 1*10**(-12)

    intervalo = [1.0, 1.5]
    x = []
    a = []
    b = []

    a.append (intervalo[0]), b.append (intervalo[1])

    print (f'Tolerância: {tol:.12f}')
    print (f'Intervalo usado: [{a[0]}, {b[0]}]')
    
    if (func(a[0]) * func(b[0]) > 0):
        print (f'Não temos raiz no intervalo: [{a[0]}, {b[0]}], por favor escolha outro!')

    while True:
        x.append(round(0.5 * (a[n] + b[n]), 16))

        if (abs (func(x[n])) < tol):
            print (f'O programa convergiu na interação {n} com x = {x[n]:.16f}')
            break
        else:
            if (func (a[n]) * func (x[n]) < 0):
                a.append(round(a[n], 16))
                b.append(round(x[n], 16))
            else:
                b.append(round (b[n], 16))
                a.append(round (x[n], 16))
        n += 1
        if (n == nmax):
            print ('O programa terminou sem atingit a tolerância desejada')
            break
    
    for i in range (0, n):
        if (i < 10):
            print (f' Interação: {i: 5} | x[0{i}] = {x[i]: <25.16f} | x[0{i}] = {a[i]: <20.16f} | b[0{i}] = {b[i]: <20.16f} | Erro: {abs(a[i]-b[i])/2:.16f}')
        else:
            print (f' Interação: {i: 5} | x[{i}] = {x[i]: <25.16f} | x[{i}] = {a[i]: <20.16f} | b[{i}] = {b[i]: <20.16f} | Erro: {abs(a[i]-b[i])/2:.16f}')

    # Plotagem do gráfico
    i = [i for i in range (0, len(x))]
    plt.title ("Método da Bissecção")
    plt.xlabel ("Eixo X")
    plt.ylabel ("Eixto Y")
    plt.plot (i, x)
    plt.show ()

def func (x):
    return x**3 - x + 1

if __name__ == "__main__":
    metodo_da_bisseccao ()