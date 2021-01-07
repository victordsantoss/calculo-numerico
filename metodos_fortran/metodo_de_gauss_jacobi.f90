! Implementação do método de Gauss-Jacobi para resolução de Sistemas Lineares

program gauss_jacobi

    implicit none   

    integer :: i, j, k, N
    double precision :: soma
    double precision, dimension (:), allocatable :: b, x, xnew
    double precision, dimension (:,:), allocatable :: a

    N = 3

    allocate(a(1:N, 1:N))
    allocate(b(1:N)) 
    allocate(x(1:N)) 
    allocate(xnew(1:N))

    !Matriz dos coeficientes
    a(1,1) = 10.d0
    a(1,2) = 1.d0
    a(1,3) = 1.d0
    a(2,1) = 2.d0
    a(2,2) = -7.d0
    a(2,3) = 0.d0
    a(3,1) = 4.d0
    a(3,2) = -2.d0
    a(3,3) = 18.d0

    !Vetor solução
    b(1) = 8.d0
    b(2) = 3.d0
    b(3) = 7.d0

    !chute inicial
    x(1) = 139047.d0
    x(2) = -1297.d0
    x(3) = 892643.d0

    ! Processo Iterativo
    do k = 1, 100 
        do i = 1, N 
            soma = 0.d0
            do j = 1, N 
                if (j.ne.i) then 
                    soma = soma + a(i,j) * x(j)
                end if
            end do
            xnew(i) = (b(i) - soma)/a(i, i)
        end do 
        x = xnew ! Atualização para Gauss-Jacobi
        write (*,*) k, x(1), x(2), x(3)
    end do

    ! Verificação da Solução
    do i=1,N
        soma = 0.d0
        do j=1,N
            soma = soma + a(i,j)*x(j)
        end do
        write(*,*) i, b(i)-soma 
    end do

    deallocate(a)
    deallocate(b)
    deallocate(x)
    deallocate(xnew)

end program gauss_jacobi