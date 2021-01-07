! Exemplo usado: x^3-x-1 = 0

program newton_raphson
    implicit none

    integer :: nfim, n
    double precision, dimension (:), allocatable :: x

    nfim = 100

    allocate(x(0:nfim))

    ! Laço para determinar a raiz
    x(0) = 0.0d0
    do n = 0, nfim-1
        x(n+1) = g(x(n))
    end do

    !Laço de salvamento no arquivo
    open(unit=1234, file='saida.dat', status='unknown')
    do n=1,Nfim
        write(1234,*) n, x(n), abs(x(n)-x(n-1)), abs(x(n)-x(Nfim))
    end do
    close(unit=1234)

    contains
        
        function g(x)
            implicit none
            double precision :: g, x
            g = x - (f(x)/flinha(x))
            return
        end function g

        function f(x)
            implicit none
            double precision :: x, f
            f = x**3-x-1.d0
            return
        end function f
        
        function flinha(x)
            implicit none
            double precision :: flinha, x
            flinha = 3.d0*x**2-1.d0
            return
        end function flinha
end program newton_raphson