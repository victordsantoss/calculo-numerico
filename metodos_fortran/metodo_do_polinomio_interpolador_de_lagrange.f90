! Uso do Progama de Ajuste de curvas para a implementação do Polinômio Interpolador

program ajuste 

    implicit none 

    integer :: Npoints, i, grau, j, k
    double precision :: soma, x
    double precision, dimension (:), allocatable :: t, y, bnovo, alpha
    double precision, dimension (:,:), allocatable :: a, atransp, gram
    
    Npoints = 9
    grau = 6! Grau do Polinômio

    ! Chute Inicial
    x = 0.d0

    allocate(t(Npoints))
    allocate(y(Npoints))
    allocate(a(Npoints,grau+1))
    allocate(atransp(grau+1,Npoints))
    allocate(gram(grau+1,grau+1))
    allocate(bnovo(grau+1))
    allocate(alpha(grau+1))

    !Ler os pontos x, y
    call readdata ('dados.dat', Npoints, t, y)
 
    ! Construção da matriz dos coeficientes (a) e a b já vem pelo 'dados.dat'
    do j = 1, grau +1
        do i = 1, Npoints
            a(i,j) = t(i)**(j-1)
            atransp(j,i) = a(i,j) ! Criação da matriz transposta 
        end do
    end do

    !regularizar o sistema: Matriz de Gram
    ! Multiplicar a matriz A pela transposta
    do j = 1, grau+1
        do i = 1, grau+1
            soma = 0.d0
            do k = 1, Npoints
                soma = soma + atransp(i,k)*a(k,j)
            end do
            gram (i,j) = soma
        end do 
    end do
    
    ! Multiplicar a matriz A transposta pela Matriz B
    do i = 1, grau+1
        soma = 0.d0
        do k = 1, Npoints
            soma = soma + atransp(i,k)*y(k)
        end do
        bnovo (i) = soma
    end do 

    ! Resolver o sistema
    call sistema_linear(a,y,grau+1,alpha)

    write (*,*) 'O ajuste é: ', alpha


    deallocate(t)
    deallocate(y)
    deallocate(a)
    deallocate(atransp)
    deallocate(gram)
    deallocate(bnovo)
    deallocate(alpha)
    
contains 
    
    subroutine readdata(nomearquivo, Npoints, t, y)

        implicit none

        character (len = 9) :: nomearquivo
        integer :: Npoints
        double precision, dimension (Npoints) :: t, y

        open(unit=1234, file=nomearquivo, status='old')

        do i = 1, Npoints
            read (1234, *) t(i), y(i)
        end do

        close(unit=1234)

    end subroutine readdata

    subroutine sistema_linear(a,b,N,x)

    implicit none

    integer, intent (in) :: N
    integer :: i,j,k
    double precision, dimension(N), intent (in) :: b
    double precision, dimension(N), intent (out) :: x
    double precision, dimension(N,N), intent (in) :: a
    double precision :: soma

    do k=1,10000000 
       do i=1,N !laço nas linhas
          soma = 0.d0
          do j=1,N!laço nas colunas
             if(j.ne.i) then
                soma = soma + a(i,j)*x(j)
             end if
          end do
          x(i) = (b(i) - soma)/a(i,i)
       end do
    end do

    return

  end subroutine sistema_linear

end program ajuste