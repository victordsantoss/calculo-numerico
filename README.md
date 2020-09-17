# :warning: O que será abordado? 
Desevolvimento e caracterização de algoritimos eficientes para computar precisamente processos matemáticos. Onde o interesse está em processos que independente do nosso chute inicial em determinado intervalo, venham a convergir após um número N de interações.

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
### :collision: 1. Método de Newton-Raphson: 
  * Baseado no aproximamento sucessivo a raiz da função f(x) por meio da raiz da reta tangente no ponto. 
  * O método: Xn+1 = Xn - f(X(n) / f'(X(n)
  
  ![Método de Newton](https://upload.wikimedia.org/wikipedia/commons/b/bb/Newton%E2%80%93Raphson_method.png)
  
### :collision: 2. Método da Bisseção 
  * Diminuição Gradativa do intervalo por meio do cálculo do ponto médio.
  ![Método da Bissecção](https://sites.google.com/site/calcnum10/_/rsrc/1475769500201/home/lista-2/metodos/metodo-da-bisseccao/Bissec%C3%A7%C3%A3o.png)


## :running: Como executar esses progrmas usando o sistema Linux :question:
**1. Python**
> Primero passo: Clonar este repositório
     
    git clone https://github.com/victordsantoss/calculo_numerico.git
> Acesse a pasta raiz do repositório

    cd ../../calculo_numerico
> Escolha um arquivo de preferência e execute o processo de compilação e execução
    
    python nome_arquivo.py
**2. Fortran**
> Primero passo: Clonar este repositório
     
    git clone https://github.com/victordsantoss/calculo_numerico.git
> Acesse a pasta raiz do repositório

    cd ../../calculo_numerico

> Escolha um arquivo de preferência e execute o processo de compilação e execução
    
    gfortran nome_arquivo.f90
    ./a.out
> Será gerado um arquivo saida.dat que são os dados referentes ao seu método. Agora para visualizar o gráfico é simples! Basta seguir 2 etapas extremamente fáceis. 
    
    Abrir a ferramenta Gnuplot na pasta do arquivo saida.dat, executando: gnuplot
> Comando simples para gerar um grafico: 
    
    plot 'nome_arquivo.dat' using 1:2 with lines 
