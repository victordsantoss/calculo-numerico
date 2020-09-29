program elminacao_gaussiana

    implicit none

    integer :: i, j, k, tamMatriz
    double precision, dimension (:,:), allocatable :: m, lambda, a
    double precision, dimension (:), allocatable :: x
    double precision :: soma

    tamMatriz = 5 

    allocate(x(tamMatriz))
    allocate(m(tamMatriz, tamMatriz + 1)) ! Atenção: vetor solução b(i) = m(i,n+1)
    allocate(lambda(tamMatriz, tamMatriz))
    allocate(a(tamMatriz, tamMatriz + 1))

    ! Definição da matriz
    m(1,1) = 2.d0
    m(1,2) = 1.d0
    m(1,3) = -1.d0
    m(1,4) = 1.d0
    m(1,5) = -3.d0
    m(1,6) = 7.d0

    m(2,1) = 1.d0
    m(2,2) = 0.d0
    m(2,3) = 2.d0
    m(2,4) = -1.d0
    m(2,5) = 1.d0
    m(2,6) = 2.d0

    m(3,1) = 0.d0
    m(3,2) = -2.d0
    m(3,3) = 1.d0
    m(3,4) = 1.d0
    m(3,5) = -1.d0
    m(3,6) = 2.d0

    m(4,1) = 3.d0
    m(4,2) = 1.d0
    m(4,3) = -4.d0
    m(4,4) = 0.d0
    m(4,5) = 5.d0
    m(4,6) = 6.d0

    m(5,1) = 1.d0
    m(5,2) = -1.d0
    m(5,3) = -1.d0
    m(5,4) = -1.d0
    m(5,5) = 1.d0
    m(5,6) = 3.d0

    a = m

    !Laço de cálculo para eliminação gaussiana 
    do j = 1, tamMatriz !Laço de cálculo nas colunas 
        if (m(i, j).eq.0) then 
            write (*, *) 'Impossível continuar, Zero na diagonal: ', j
            read (*, *) !Comando para parar o programa 
        else 
            do i = j + 1, tamMatriz 
                lambda(i, j) = m(i, j) / m(j, j) !Calculo dos lambdas
                do k = 1, tamMatriz + 1
                    m(i, k) = m(i, k) - lambda(i, j) * m(j, k) !Substituição das linhas
                end do
            end do
        end if 
    end do 

    ! Laço de cálculo para substituição reversa
    x(tamMatriz) = m(tamMatriz, tamMatriz + 1) / m(tamMatriz, tamMatriz)

    do i = tamMatriz - 1, 1, -1 ! Terceiro argumento é o incremento 
        soma = 0.d0 
        do k = i+1, tamMatriz
            soma = soma + m(i, k) * x(k) !Cálculo da soma que vai para o lado direito
        end do 
        x(i) = (m(i, tamMatriz + 1)-soma) / m(i, i)
    end do 

    !Laço de impressão na tela
    do i = 1,tamMatriz
        write(*, *) 'Solução x(', i,') =', x(i)
    end do

    !Laço de verificação do resultado
    do i = 1, tamMatriz !laço nas linhas
        soma = 0.d0 !zero para cada linha
        do j = 1,tamMatriz
            soma = soma + a (i ,j) * x(j)
        end do
        write(*,*) 'Verificação da solução de x(',i,')', soma - a(i, tamMatriz + 1)
    end do

    deallocate(x)
    deallocate(m)
    deallocate(lambda)
    deallocate(a)

end program elminacao_gaussiana