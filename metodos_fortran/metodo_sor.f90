program sor

  implicit none

  double precision, dimension (:), allocatable :: x,b,xnew
  double precision, dimension (:,:), allocatable :: a
  double precision :: soma, omega
  integer :: N,i,k,j

  N = 3
  omega = 1.4d0
  
  allocate(x(N))
  allocate(xnew(N))
  allocate(b(N))
  allocate(a(N,N))

  a(1,1) = 2.d0
  a(1,2) = -1.d0
  a(1,3) = 0.d0
  a(2,1) = -1.d0
  a(2,2) = 2.d0
  a(2,3) = -1.d0
  a(3,1) = 0.d0
  a(3,2) = -1.d0
  a(3,3) = 2.d0

  !Vetor solução
  b(1) = 1.d0
  b(2) = 1.d0
  b(3) = 1.d0
    
  do k = 0,100
     do i=1,N
        soma = 0.d0
        do j=1,N
           if(j.ne.i) then
              soma = soma + a(i,j)*x(j)
           end if
        end do
        x(i) = (1.d0-omega)*x(i) + omega*(b(i) - soma)/a(i,i)
     end do
!     x = xnew
     write(*,*) x
  end do

  open(unit =123, file='saida.dat', status='unknown')
  do i=1,100
     write(123,*) i, sin(1.d0*i),log(1.d0*i)
  end do
  close(unit=123)
  
  deallocate(x)
  deallocate(xnew)
  deallocate(b)
  deallocate(a)
  
  end program sor