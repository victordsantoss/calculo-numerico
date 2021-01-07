! Programa para resolver a integral de x * cos(x) dx
! Métodos usados: Retângulo, Trapézios e Quadratura Gaussiana 

program integral

    implicit none

    integer :: i, N
    double precision :: a, b, soma, h, Iret, Itrap, Igauss, a0, a1, a2, c0, c1, c2, pi2
    double precision, dimension (:), allocatable :: x

    ! Atençã: Consideramos os pontos de 0 até N, ou seja, N+1 pontos!
    N = 10
    a = 0.d0
    b = dacos(-1.d0) ! Escrevendo pi com precisão de máquina

    ! Cálculo do passo 
    h = abs(b-a)/(1.d0*N)

    allocate (x(0:N))
    
    ! Cálculo do x(i)
    do i = 0, N
        x(i) = a + i*h
    end do 

    ! Integração por retângulos pela Esquerda
    soma = 0.d0
    do i = 0, N-1
        soma = soma + f(x(i))*h
    end do
    Iret = soma

    ! Integração por Trapézios
    soma = 0.d0

    ! Cálculo do x(i)
    do i = 1, N-1
        soma = soma + f(x(i))
    end do

    ! Cálculo da integral
    Itrap = h * (soma + 0.5d0 * (f(x(0))+f(x(N)))) 

    ! Quadratura Gaussiana 
    a0 = 0.888888889d0
    a1 = 0.555555556d0
    a2 = 0.555555556d0
    pi2 = dacos(-1.d0)/2.d0
    c0 = pi2 * (0.d0+1.d0)
    c1 = pi2 * (dsqrt(3.d0/5)+1.d0)
    c2 = pi2 * (-dsqrt(3.d0/5)+1.d0)

    Igauss = pi2 * (a0*f(c0) + a1*f(c1) + a2 * f(c2))

    write (*,*) 'Iret =', Iret, 'Passo=', h, 'Erro=', abs(-2.d0-Iret)
    write (*,*) 'Itrap =', Itrap, 'Passo=', h, 'Erro=', abs(-2.d0-Itrap)
    write (*,*) 'Igauss=', Igauss, 'Passo=', h, 'Erro=', abs(-2.d0-Igauss)
    write (*,*) 'Valor exato da integral = ', -2.d0

    deallocate(x)
    contains

        function f(x)

            double precision :: f, x

                !f = dsin(x)*dsin(x)
                f = x*dcos(x)

            return 
    
        end function f


end program integral

