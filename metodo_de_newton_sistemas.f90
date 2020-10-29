! Programa de Newton-Raphson para resolução de sistemas não lineares.
! Sistema usado:
! x1 * x2 - 25 = 0
! x1² + x2² - 64 = 0

program nr_sist

    implicit none

    double precision, dimension(:), allocatable :: x,y
    integer :: N, k
    
    N = 2
    allocate(x(N))
    allocate(y(N))

    ! Chuts iniciais
    x(1) = 3.d0
    x(2) = 7.0d0

    !--------------Newton-Raphson
    do k = 1,50
        call sistema_linear(jacob(N,x),f(N,x),N,y)
        x = x - y
        write(*,*) k, x !(1), x(2)
    end do
    !--------------Newton-Raphson

    deallocate(x)
    deallocate(y)
        
    contains

    function jacob(N,x)

        implicit none

        integer :: N
        double precision, dimension (N) :: x
        double precision, dimension (N,N) :: jacob

        ! Calculo da Matriz Jacobiana: Derivada dos coeficientes de todas as variáveis possíveis
        jacob(1,1) = x(2)
        jacob(1,2) = x(1)
        jacob(2,1) = 2.d0*x(1)
        jacob(2,2) = 2.d0*x(2)
        
        return 
        
    end function jacob

    function f(N,x)

        implicit none

        integer :: N
        double precision, dimension(N) :: f,x

        ! Componentes do sistema:
        ! x1 * x2 - 25 = 0
        ! x1² + x2² - 64 = 0
        f(1) = x(1)*x(2)-25.d0
        f(2) = x(1)*x(1)+x(2)*x(2)-64.d0
        
        return
        
    end function f
    
    subroutine sistema_linear(a,b,N,x)

        implicit none

        ! Definição de N como valor de entrada nos parâmetros
        integer, intent (in) :: N
        integer :: i,j,k
        double precision, dimension(N), intent (in) :: b
        double precision, dimension(N), intent (out) :: x
        double precision, dimension(N,N), intent (in) :: a
        double precision :: soma

        ! Processo Iterativo para resolução de Sistemas Lineares usando Gauss Seidel
        do k=1,100
        do i=1,N
            soma = 0.d0
            do j=1,N
                if(j.ne.i) then
                    soma = soma + a(i,j)*x(j)
                end if
            end do
            x(i) = (b(i) - soma)/a(i,i)
        end do
        end do

        return

    end subroutine sistema_linear
    
end program nr_sist