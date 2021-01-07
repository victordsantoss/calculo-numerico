import numpy
import math

'''
    a -> Matriz dos Coeficientes
    b -> Vetor Resultante da Matriz dos Coeficientes
    vetor_solução -> Vetor contendo os chutes iniciais 
    iterações -> Números de Iterações necessárias ou imagináveis para encontrar a solução
'''

def gauss_jacobi (a, b, vetor_solucao, iteracoes):

    i = 0
    vetor_aux = []

    for k in range (len(vetor_solucao)):
        vetor_aux.append(0)

    while i < iteracoes:
        for j in range(len(a)):
            x = round(b[j], 16)
            for k in range (len(a)):
                if j != k:
                    x -= round(a[j][k] * vetor_solucao[k], 16)
            x /= round (a[j][j], 16)
            vetor_aux[j] = round (x, 16)
        i += 1
        for p in range (len(vetor_aux)):
            vetor_solucao[p] = round (vetor_aux[p], 16)
        print (f'Iteração: {i:<5} {vetor_solucao[0]: <30.17f} {vetor_solucao[1]: <30.17f} {vetor_solucao[2]: <30.17f}')

    print (f'\nVerificação da Solução: \n')

    for j in range (len(a)):
        soma = 0
        for k in range (len(a)):
            soma += a[j][k] * vetor_solucao[k]
        print (f'Iteração {j} {b[j] - soma:.15f}')

if __name__ == "__main__":
    gauss_jacobi([[10,1,1],[2,-7,0],[4,-2,18]],[8,3,7],[139047,-1297,892643],30)