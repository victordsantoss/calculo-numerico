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
   
  

## :question: Métodos apresentados: 
### :collision: 1. Método de Newton-Rapshon: 
  * Baseado no aproximamento sucessivo a raiz da função f(x) por meio da raiz da reta tangente no ponto. 
  * O método: Xn+1 = Xn - f(X(n) / f'(X(n)
  
  ![Método de Newton](https://upload.wikimedia.org/wikipedia/commons/b/bb/Newton%E2%80%93Raphson_method.png)
  
### 2. Método da Bisseção 


