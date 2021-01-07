# :warning: O que será abordado? 
Métodos Numéricos desenvolvidos na disciplina de Cálculo Numérico, sendo a caracterização de algoritimos eficientes para computar precisamente processos matemáticos. Onde o interesse está em processos que independente do nosso chute inicial em determinado intervalo, venham a convergir após um número N de interações.

É importante saber que queremos encontrar um x* que aplicado a uma g(x*) estabilize a equação. Sobre esse x* temos, algumas definições:
  * Assintoticamente Estável: O processo iterativo é atraído por este ponto fixo.
  * Estável: Os processos iterativos que começam suficientemente próximos desse ponto, permanecerão próximos, mas não tenderão a ele.
  * Instável: Os processos iterativos que começam sufientemente próximos desse ponto, tenderão a se afastar.   
  
:heavy_plus_sign: Teorema:
  Considere uma função f(x) contínua no intervaloo real [a,b] e derivável no invervalo (a,b), tal que, f(a) * f(b) < 0. Então, existe pelo menos um número x* ∈ (a,b) | f(x*) = 0, isto é, existe pelomenos uma raiz da função f(x) no intervalo (a,b).
  
 :warning: Atenção:
  * É possível que, f(a) * f(b) < 0 possibilite a existência de mais de uma raix no intervalo (a,b).
  * Se f(a) * f(b) > 0 não podemos afirmar nada.
  * A continuidade da f(x) é fundamental para que o resultado do teorema aplicado ao método escolhido funcione.
  
  
## :computer: Requisitos
Veremos algoritimos implementados em linguagem [Python](https://www.python.org/downloads/) e [Fortran](https://gcc.gnu.org/wiki/GFortranBinaries#Windows). Logo se faz necessário a instalação dessas duas tecnologias, junto aos seus compiladores. 

:books: Para a plotagem dos gráficos nos exemplos de python é necessário a biblioteca **Matplotlib** que pode ser acessada clicando [aqui](https://matplotlib.org/downloads.html).

:books: Para a plotagem dos gráficos nos exemplos de Fortran usaremos a ferramenta **Gnuplot** que pode ser acessada clicando [aqui](https://sourceforge.net/projects/gnuplot/files/gnuplot/).
   
  

## :question: Métodos apresentados: 
#### :collision: 1. Método de Newton-Raphson
#### :collision: 2. Método da Bisseção 
#### :collision: 3. Método da Eliminação Gaussiana
#### :collision: 4. Método da Decomposição LU 
#### :collision: 5. Método de Gauss com Pivoteamento 
#### :collision: 6. Método de Gauss Jacobi 
#### :collision: 7. Método de Gauss Seidel  
#### :collision: 8. Método de Newton Rapshon para Resolução de Sistemas não Lineares
#### :collision: 9. Método de Ajuste de Curvas
#### :collision: 10. Método do Polinômio Interpolador de LaGrange
#### :collision: 11. Método da Diferenciação Numérica
#### :collision: 12. Método do Retângulo
#### :collision: 13. Método do Trapézio
#### :collision: 14. Método da Quadratura Gaussiana
#### :collision: 15. Método de Euler
#### :collision: 16. Método de Runge-Kutta de 4ª Ordem 
#### :collision: 17. Método SOR

## :running: Como executar esses progrmas usando o sistema Linux :question:
**1. Python**
> Clonar este repositório
     
    git clone https://github.com/victordsantoss/calculo-numerico.git
> Acessar a pasta raiz do repositório

    cd ../../calculo-numerico
> Escolher um arquivo de preferência e execute o processo de compilação e execução
    
    python nome_arquivo.py
**2. Fortran**
> Clonar este repositório
     
    git clone https://github.com/victordsantoss/calculo-numerico.git
> Acessar a pasta raiz do repositório

    cd ../../calculo-numerico

> Escolher um arquivo de preferência e execute o processo de compilação 
    
    gfortran nome_arquivo.f90
> Rodar o processo de execução

    ./a.out
> Será gerado um arquivo saida.dat que são os dados referentes ao seu método. Agora para visualizar o gráfico é simples! Basta seguir 2 etapas extremamente fáceis. 
    
    Abrir a ferramenta Gnuplot na pasta do arquivo saida.dat, executando: gnuplot
> Comando simples para gerar um grafico: 
    
    plot 'nome_arquivo.dat' using 1:2 with lines 
