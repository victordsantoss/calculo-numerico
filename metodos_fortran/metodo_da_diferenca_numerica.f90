! Exercício sobre derivação numérica
! Comando GNuplot plot cos(x) w l, 'saida_av.dat' u 1:3 w p pt 4 ps 1.5 t 'Avancada', 'saida_at.dat' u 1:3 w p pt 8 ps 1.5 t 'Atrasada', 'saida_ct.dat' u 1:3 w p pt 10 ps 1.5 t 'Centrada'

program derivada

    implicit none
    
    integer :: Ninter, i
    double precision :: h
    double precision, dimension (:), allocatable :: y, ylinha_at, ylinha_av, ylinha_ct, yduaslinhas, yduaslinhas4

    Ninter = 20

    allocate (y(0:Ninter))
    allocate (ylinha_at(1:Ninter))
    allocate (ylinha_av(0:Ninter-1))
    allocate (ylinha_ct(0:Ninter))
    allocate (yduaslinhas(0:Ninter))
    allocate (yduaslinhas4(0:Ninter))

    h = 2.d0 * dacos(-1.d0)/(1.d0 * Ninter)

    ! Geração da função seno 
    do i = 0, Ninter
        y(i) = dsin(i*h)
    end do 

    ! Cálculo da Derivada
    ! Diferença Resgressiva (Atrasada)
    do i = 1, Ninter
        ylinha_at(i) = (y(i) - y(i-1))/h
    end do 

    ! Diferença Progressiva (Avançada)
    do i = 0, Ninter-1
        ylinha_av(i) = (y(i+1) - y(i))/h
    end do

    ! Diferença Centrada (Forma eficiente)
    ! Diferença Avançada com 3 pontos na primeira derivada
    ylinha_ct(0) = (-1.5d0*y(0)+2.d0*y(1)-0.5d0*y(2))/h !avançada de ordem 2
    
    !Diferenças centradas
    do i=1,Ninter-1
        ylinha_ct(i) = (y(i+1)-y(i-1))/(2.d0*h)
    end do
    ! Diferença Atrasada com 3 pontos na primeira derivada
    ylinha_ct(Ninter) = (1.5d0*y(Ninter)-2.d0*y(Ninter-1)+0.5d0*y(Ninter-2))/h 

    ! Cálculo da Diferença centrada com 3 pontos para a SEGUNDA DERIVADA
    do i=1,Ninter-1
        yduaslinhas(i) = (y(i+1)-2.d0*y(i)+y(i-1))/(h*h)
    end do

    ! Cálculo da Diferença Centrada Segunda de Quarta Ordem
    ! -1/12 4/3 -5/2 -1/12
    do i=2,Ninter-2
        yduaslinhas4(i) = (-y(i-2)/12.d0+4.d0*y(i-1)/3.d0-5.d0*y(i)/2.d0+4.d0*y(i+1)/3.d0-y(i+2)/12.d0)/(h*h)
    end do

    open(unit=1234,file='saida_at.dat',status='unknown')
    do i=1,Ninter
        write(1234,*) i*h,y(i),ylinha_at(i)
    end do
    close(unit=1234)

    open(unit=1235,file='saida_av.dat',status='unknown')
    do i=0,Ninter-1
        write(1235,*) i*h,y(i),ylinha_av(i)
    end do
    close(unit=1235)

    open(unit=1236,file='saida_ct.dat',status='unknown')
    do i=0,Ninter
        write(1236,*) i*h,y(i),ylinha_ct(i)
    end do
    close(unit=1236)

    open(unit=1237,file='saida_seg.dat',status='unknown')
    do i=1,Ninter-1
        write(1237,*) i*h,y(i),yduaslinhas(i)
    end do

    open(unit=1238,file='saida_seg4.dat',status='unknown')
    do i=2,Ninter-2
        write(1238,*) i*h,y(i),yduaslinhas4(i)
    end do
    close(unit=1238)

    deallocate(y)
    deallocate(ylinha_at)
    deallocate(ylinha_av)
    deallocate(ylinha_ct)
    deallocate(yduaslinhas)
    deallocate(yduaslinhas4)

end program derivada