# Importação de bibliotecas
import math 
import numpy

def main ():
    gaus_pivoteamento([[1,2,-1],[2,-1,1],[1,1,1]],[2,3,6])

def gaus_pivoteamento (a, b):

    # acessar as linhas da matriz
    for i in range (len(a)):

        #verificar qual é o maior pivô 
        pivo = math.fabs(a[i][i])
        linha_pivo = i
        for j in range (i+1,len(a)):
            if math.fabs(a[j][i] > pivo):
                pivo = math.fabs(a[j][i])
                linha_pivo = j
                
        # Permutar as linhas caso seja necessário
        if linha_pivo != i:
            linha_auxiliar = a[i]
            a[i] = a[linha_pivo]
            a[linha_pivo] = linha_auxiliar

            b_auxiliar = b[i]
            b[i] = b[linha_pivo]
            b[linha_pivo] = b_auxiliar

        # Eliminação gaussiana 
        for m in range (i+1, len(a)):
            multiplicador = a[m][i]/a[i][i]
            for n in range (i, len (a)):
                a[m][n] -= multiplicador*a[i][n]
            b[m] -= multiplicador*b[i]

    print ("Matriz A escalonada e Vetor B com as devidas modificações: ") 
    for k in range (len(a)):
        print(a[k])
    print (f'\n{b}\n')
    calcula_solucao (a,b)

def calcula_solucao (a, b):

    vetorsolucao = []

    for i in range (len(a)):
        vetorsolucao.append(0)

    linha = len(a) - 1

    while linha >= 0:
        x = b[linha]
        coluna = len(a)-1
        while coluna > linha:
            x -= a[linha][coluna] * vetorsolucao[coluna]
            coluna -= 1
        x /= a[linha][linha]
        linha -= 1
        vetorsolucao[coluna] = x

    print ("Vetor Solução da Equação: ")
    for j in range (len(vetorsolucao)):
        print(f'x[{j}] = {vetorsolucao[j]}')

if __name__ == "__main__":
    main ()