! Exemplo usado: x^3-x-1 = 0
program bissecao
    implicit none

    ! Declaração de variáveis
    integer :: k, sair, nmax, i
    double precision, dimension (:), allocatable :: x, a, b
    double precision :: tol

    nmax = 100

    allocate(x(0:nmax))
    allocate(a(0:nmax))
    allocate(b(0:nmax))

    tol = 1.d-12
    sair = 0

    k = 0
    a(0) = 1.0d0
    b(0) = 1.5d0

    ! Verificação de f(a) * f(b) > 0
    if (f(a(0))*f(b(0)).gt.0) then
        write (*,*) 'Não temos raiz nesse intervalo, escolha outro'
        sair = 1
    end if

    do while (sair.eq.0)
        x(k) = 0.5d0*(a(k)+b(k))

        if (abs(f(x(k))).lt.tol) then 
            write (*,*) 'A raiz foi encontrada e o programa convergiu'
            sair = 1
        else
            if (f(a(k))*f(x(k)).lt.0d0) then 
                a(k+1) = a(k)
                b(k+1) = x(k)
            else 
                b(k+1) = b(k)
                a(k+1) = x(k)
            end if
        end if
        k = k + 1

        if (k.eq.nmax) then
            write (*,*) 'Foi atingido o número máximo de interações e o programa não convergiu'
            sair = 1
        end if
    end do

    open (unit = 123, file = 'saida_bis.dat', status = 'unknown')
    
    do i = 0, k-1
        write (123,*) i, x(i), a(i), b(i), abs(a(i) - b(i))/2.d0
    end do
    close (unit = 123)

    deallocate(x)
    deallocate(b)
    deallocate(a)
    

    contains

        function f(x)
            
            implicit none

            double precision :: f, x

            f = x**3-x-1.d0

            return

        end function f

end program bissecao