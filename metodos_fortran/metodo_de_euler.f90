program euler

  implicit none

  double precision :: h
  integer :: i, Nfim
  double precision, dimension (:), allocatable :: y,t,yrk
  double precision :: k1,k2,k3,k4

  Nfim = 40
  h = 2.0d0/dble(Nfim)

  allocate(t(0:Nfim))
  allocate(y(0:Nfim))
  allocate(yrk(0:Nfim))
  
  t(0) = 0.d0

  !Implementação do método de Euler
  y(0) = 1.d0 !condição inicial do PVI
  do i=0,Nfim-1
     t(i+1) = t(i) + h
     y(i+1) = y(i) + h*f(t(i),y(i)) !Método de Euler
  end do

  !Implementação do método de RK 4ª ordem
  yrk(0) = 1.d0
  do i=0,Nfim-1
     k1 = h*f(t(i),yrk(i))
     k2 = h*f(t(i)+0.5d0*h,yrk(i)+0.5d0*k1)
     k3 = h*f(t(i)+0.5d0*h,yrk(i)+0.5d0*k2)
     k4 = h*f(t(i)+h,yrk(i)+k3)
     yrk(i+1) = yrk(i) + (k1+2.d0*k2+2.d0*k3+k4)/6.d0
  end do
  
  open(unit=1234,file='saida.dat',status='unknown')
  do i=0,Nfim
     write(1234,*) t(i),y(i),yrk(i)
  end do
  close(unit=1234)
  
  deallocate(t)
  deallocate(y)
  deallocate(yrk)
  
contains

  function f(t,y)

    implicit none

    double precision :: t,y,f
    
    f = t*t-2.d0*y

    return
    
  end function f

end program euler