
import numpy

def main ():

    tam_matriz = int (input('Defina o tamanho da matriz: '))                                 

    # Implementação das Matrizes A e B
    a = numpy.zeros((tam_matriz, tam_matriz), dtype = numpy.float64)
    b = numpy.zeros((tam_matriz, 1), dtype = numpy.float64)

    print (f'\nValores para matriz A[{tam_matriz}][{tam_matriz}]')
    for linha in range (0,tam_matriz):
        for coluna in range (0,tam_matriz):
            a[linha][coluna] = int (input(f'Digite um valor para [{linha}][{coluna}]: '))
    
    print (f'\nValores para matriz B[{tam_matriz}][{1}]')
    for linha in range (0,tam_matriz):
            b[linha][0] = int (input(f'Digite um valor para [{linha}][{0}]: '))
   
    triangular_superior (a, b)
    print (f'Raizes do Sistema: \n', triangular_solver (a,b))

 
def triangular_solver (a,b):
    n = numpy.size(b)
    x = numpy.zeros(n)

    x[-1] = b[-1]/a[-1,-1]

    for i in reversed(range(n-1)):
        s = 0
        for j in range (i+1,n):
            s += a[i,j]*x[j]
        x[i] = (b[i]-s)/a[i,i]

    return x

def triangular_superior (a,b):

    n = numpy.size(b)

    for k in range (n-1):
        for i in range (k+1, n):
            m = a[i,k]/a[k,k] # Multiplicador responsável por zerar as linhas
            a[i,:] = a[i,:] - m*a[k,:]
            b[i] = b[i] - m*b[k]
    
if __name__ == "__main__":
    main ()