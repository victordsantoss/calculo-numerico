! Solução para a Equação do Pêndulo de segunda Ordem: y" + w²*sen(y) = 0 | y(0) = 1 | y'(0) = 0
! Comando Gnuplot : plot 'saida.dat' using 1:2 w lp, 4*cos(x) w l

program rk4

  implicit none

  double precision, dimension (:), allocatable :: y
  double precision, dimension (:), allocatable :: k1,k2,k3,k4
  double precision :: t,h
  integer :: N, Nfim, i
  
  N = 2 !tamanho do sistema a ser resolvido
  allocate(y(N))
  allocate(k1(N))
  allocate(k2(N))
  allocate(k3(N))
  allocate(k4(N))

  Nfim = 200
  h = 20.d0/dble(Nfim)
  
  open(unit=1234,file='saida.dat',status='unknown')
  !Condições iniciais para o RK4
  t = 0.d0
  y(1) = 3.0d0
  y(2) = 0.d0

  write(1234,*) t,y

  !Início do RK4
  do i=0,Nfim-1
    k1 = h*f(N,t,y)
    k2 = h*f(N,t+0.5d0*h,y+0.5d0*k1)
    k3 = h*f(N,t+0.5d0*h,y+0.5d0*k2)
    k4 = h*f(N,t+h,y+k3)
    ! y agora é único para cada iteração
    y = y + (k1+2.d0*k2+2.d0*k3+k4)/6.d0
    t = t+h
    write(1234,*) t,y
  end do
  close(unit=1234)

  deallocate(y)
  deallocate(k1)
  deallocate(k2)
  deallocate(k3)
  deallocate(k4)

contains

  function f(N,t,y)

    implicit none

    double precision, dimension (N) :: f, y
    double precision :: t
    integer :: N
    
    f(1) = y(2)
    f(2) = -dsin(y(1))
    
    return
    
  end function f
  
end program rk4