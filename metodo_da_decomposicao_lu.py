import numpy as np

def main ():

    tam_matriz = int (input("Introduza o número de colunas: "))

    # Criação de matrizes de tamanho NxN iniciadas com elementos 0
    matriz_a = np.zeros([tam_matriz,tam_matriz])
    matriz_u = np.zeros([tam_matriz,tam_matriz])
    matriz_l = np.zeros([tam_matriz,tam_matriz])
    vetor_b = np.zeros([tam_matriz])

    # Inserção de Elementos na Matriz A e na Matriz B
    print ("Introduza o elementos da matriz: ")
    for r in range (0, tam_matriz):
        for c in range (0, tam_matriz):
            matriz_a[r,c] = (input(f"Elemento a[{r+1},{c+1}]: "))
            matriz_a[r,c] = float(matriz_a[r,c])
            matriz_u[r,c] = matriz_a[r,c]

    print ("Introduza o elementos do vetor B: ")
    for i in range (0, tam_matriz):
        vetor_b[i] = (float(input(f"Elemento a[{i+1}]: ")))

    # Operações de geração de matrizes L e U
    for k in range (0, tam_matriz):
        for r in range (0, tam_matriz):
            if (k == r):
                matriz_l[k,r] = 1
            if (k < r):
                factor = (matriz_a[r,k]/matriz_a[k,k])
                matriz_l[r,k] = factor
                for c in range (0, tam_matriz):
                    matriz_a[r,c] = matriz_a[r,c] - (factor * matriz_a[k,c])
                    matriz_u[r,c] = matriz_a[r,c]

    # Impressão das Matrizes L e U
    print ("Matriz U: ")
    print (matriz_u)
    print ("Matriz L")
    print (matriz_l)

    # Criação do vetor solução y
    print ("Vetor Solução LY = b: ")
    vetor_solucao_y = []
    for i in range (len(matriz_a)):
        vetor_solucao_y.append(0)
    linha = 0

    # Realizando a operação LY = B
    while linha < tam_matriz:
        x = vetor_b[linha]
        coluna = 0
        while coluna < linha:
            x -= matriz_l[linha][coluna] * vetor_solucao_y[coluna]
            coluna += 1
        x /= matriz_l[linha][linha]
        linha += 1
        vetor_solucao_y[coluna] = x

    # Impressão do resultado da operação
    for j in range (len(vetor_solucao_y)):
        print(f'x[{j}] = {vetor_solucao_y[j]}')

    # Criação do vetor Solução X
    print ("Vetor Solução UX = Y: ")
    vetor_solucao_x = []
    for i in range (len(matriz_a)):
        vetor_solucao_x.append(0)
    linha = len(matriz_a) - 1

    # Realizando a operação UX =Y
    while linha >= 0:
        x = vetor_solucao_y[linha]
        coluna = len(matriz_a)-1
        while coluna > linha:
            x -= matriz_u[linha][coluna] * vetor_solucao_x[coluna]
            coluna -= 1
        x /= matriz_u[linha][linha]
        linha -= 1
        vetor_solucao_x[coluna] = x

    # Impressão das raizes do sistema estudado
    for j in range (len(vetor_solucao_x)):
        print(f'x[{j}] = {vetor_solucao_x[j]}')
    
if __name__ == "__main__":
    main ()
