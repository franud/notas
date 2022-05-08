# Expression Resolver
Un parser o como lo hemos llamado en nuestro proyecto, el resolvedor de expresiones o (en el código la clase ExpressionResolver) es una clase cuya funcion es **interpretar una expresión de hoja de cálculo y devolver el valor asociado a esa expresión** y las referencias a celdas que existen en esa expresión. 
Para la resolución de este problema hemos utilizado un patrón muy utilizado para la interpretación de lenguajes de programación, la **pipeline de parsing.**

![Imagen del pipeline del parser](https://upload.wikimedia.org/wikipedia/commons/d/d6/Parser_Flow%D5%B8.gif)
Esta pipeline nos indica el proceso para transformar un Source String (nuestra expresión) a el resultado de esta expresión, y sus pasos intermedios, a continuación explicaré la funcionalidad de cada uno de estos pasos:
## Lexer
Un lexer es un programa que descompone una expresión en un flujo de tokens.
Un token es una estructura de datos que guarda información sobre los **lexemas** de la expresión, 
Cada token representa una sola unidad atómica, una *keyword*, un identificador o un signo de puntuación, en la jerga de las sintáxis de lenguajes, a estos tokens se les llama "terminales", en la sección Parser se explicará su motivo y veremos los terminales de nuestro lenguaje. 
El lexer también es responsable de ignorar todos los detalles irrelevantes de la expresión que no están relacionados con el significante del código en sí, como los espacios en blanco y los comentarios. Esto permite que el analizador se centre en el significado del código e ignore las irrelevancias, aplicando un filtro a nuestro Source String. 

Un lexer generalmente se combina con un **Parser**, que toma el flujo de tokens del lexer y crea una representación más rica y compleja de la expresión

## Parser
Un parser es una herramienta que **analiza un stream de Tokens y lo convierte en una representación interna con estructura**. Esta representación interna puede ser un árbol, un grafo o simplemente una secuencia de símbolos. En el caso de nuestro problema, nuestro **parser formará un árbol.**

Esta representación interna a menudo se le llama árbol de sintaxis abstracta o en inglés **Abstract Syntax Tree** (también abreviado AST) y está compuesta por **nodos**.
Cada nodo representa un constructo que ocurre en una expresión, por ejemplo en otros ámbitos como en la interpretación de código fuente, un nodo podría representar un programa completo, la declaración de una función, una expresión, etc. Estos nodos normalmente tienen nodos que cuelgan de ellos, que representan las objetos contenidos por el nodo padre.
Por ejemplo: Los nodos que representan expresiones aritméticas tienen como hijos nodos que representan ambos lados de los operandos de la expresión. 

Para generar este AST a partir del stream de Tokens, debemos definir que tipo de expresiones podemos generar en el lenguaje, teniendo en cuenta aspectos como mantener la jerarquia del orden de resolución de las operaciones aritméticas.
Esta restricción se define mediante reglas de un lenguaje o también llamadas **producciones**.
Cada producción produce un "tipo" de expresión válida en nuestro lenguaje, hay dos tipos de producciones:
- Terminales: Són las "palabras" de nustro lenguaje, en resumen, los simbolos de las operaciones, los puntos, las referencias a celdas, los Númericos, Textos y Fechas consstantes.
- No terminales: Són referencias a otras producciones, dando pie así a generar una sintáxis rica con repeticiones.

En nuestro caso las producciones de nuestro lenguaje de la hoja de cálculo son las siguientes (Representadas con un metalenguaje del estilo Backus-Naur):

```
expresion    ::= "=" sum | literal;
sum          ::= factor ( ("-"|"+") factor)*;
factor       ::= unary ( ("/"|"*") unary)*;
unario       ::= "-" unary | formula;
formula      ::= literal | referencia | llamadaFun | agrupación;
literal	     ::= NUMBER | STRING | DATE;
referencia   ::= refItem | rango;
rango        ::= refItem ":" refItem;
refItem      ::= CELL_REFERENCE;
llamadaFun   ::= function argumentos ")";
function     ::= FUN;
argumentos   ::= argument | argument "," argumentos;
argument     ::= sum;
agrupación   ::= "(" sum ")";
```

Donde:

*   Los terminales están indicados entre: " **" "** ".
*   Cada regla de producción está separada por: "**::=**"
*   Cada terminal está entre: "**( )**".
*   El fin de cada regla está indicado por "**;**".
*   Cada forma distinta de cada regla está separada por: "**|**".
*   El operador "**()\***" indica que puede existir 0 o más veces la expresión de dentro del paréntesis.
*   Las palabras en mayúscula son tokens terminales.

Con estas reglas podemos generar cualquier expresión de nuestro lenguaje y mantener la jerarquia de operaciones.

## Como son los nodos de nuestro AST?
Para representar los nodos de el AST he usado el patrón Interpreter, este patrón es muy utilizado para este propósito y nos permite definir propiedades de Nodos de forma recursiva, es decir, nodos que contienen Nodos, y nos facilita definir una gramática para nuestro lenguaje, ya que es una estructura muy parecida a las **producciones**.

![Diagrama UML del patrón Interpeter](https://upload.wikimedia.org/wikipedia/commons/3/33/W3sDesign_Interpreter_Design_Pattern_UML.jpg)

### Patrón visitor
Para la representación interna de nuestro AST también he usado el patrón Visitor, que me permite añadir métodos a la jerarquia de clases de Expresión, sin tener que añadir los métodos dentro de cada una de la decena de sus subclases, sino definiendo un método accept que deben aceptar todos los hijos de Expresión (Padre de todo tipo de expresiones) que tiene como parámetro una implementación de Visitor. 
Entonces, para añadir funcionalidades dentro de toda la jerarquia de clases de Expresión, solo tengo que crear una clase funcional que implemente el patrón Visitor y definir ahí las funcionalidades para cada tipo de nodo.

![Diagrama UML del patrón visitor](https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Visitor_design_pattern.svg/800px-Visitor_design_pattern.svg.png)
En el caso de este diagrama, Element sería la clase ```Expression```, y ConcreteElement sería la jerarquia de clases de Expresión (Literales, Formulas, Operaciones Binarias, etc.). Y el interprete, ```TreeResolver``` sería una implementación de Visitor.
Esto nos permite enfocar la programación de cada nodo de una forma más cercana a la programación funcional.

## Interprete
El siguiente paso es la evaluación del AST, que es el proceso de ejecución del código representado por el AST. Esto se hace recorriendo el AST y realizando alguna acción en cada tipo nodo. La acción a realizar depende del tipo de nodo que se visite. Por ejemplo, al visitar un nodo que representa una llamada de función, la acción a realizar sería llamar a la función con los argumentos dados. Otro ejemplo sería una nodo con una expresión aritmética binaria como la suma, debe sumar cada uno de sus dos lados, teninendo en cuenta que ambos lados, que también son expresiones, deben ser resueltos, al ser nodos, estos se resuelven de forma recursiva desde la raiz hasta las hojas del árbol.

## Excepciones y errores de sintáxis
Otra tarea con la que debe lidiar nuestro Resolvedor de expresiones es advertir a los usuarios sobre errores en la entrada, por ejemplo, si intentan hacer referencia a una celda con un valor no válido, una celda inexistente, use una función con firma incorrecta, una función no definida en nuestro lenguaje, etc. 
En nuestro programa esto se hace con el uso de excepciones de tipo ```ExpressionResolverException``` que cortan el análisis cada vez que se encuentran y es deber del usuario que usa la clase tratar esos errores como correspondan.

En conclusión, Expression Resolver se compone de un lexer, un analizador y un intérprete, el lexer filtrará únicamente los terminales de nuestro lenguaje, el parser creará un árbol de sintaxis abstracta que represente ese stream de Tokens  y finalmente el intérprete evaluará el AST para resolver la expresión y obtener el resultado.

Para la resolución de este problema mis fuentes han sido las siguientes:
- Crafting Interpreters de Robert Nystrom 
- A Grammar for Spreadsheet Formulas Evaluated on Two Large Datasets de Efthimia Aivaloglou, David Hoepelman, Felienne Hermans del Software Engineering Research Group de Delft University of Technology. https://ieeexplore.ieee.org/document/7335408
- https://en.wikipedia.org/wiki/Interpreter_pattern
- https://en.wikipedia.org/wiki/Operator-precedence_parser
- https://refactoring.guru/design-patterns/visitor
- https://www.youtube.com/watch?v=pL4mOUDi54o Video sobre el patrón visitor.
