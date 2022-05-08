breakfast  → protein "with" breakfast "on the side" ;
breakfast  → protein ;
breakfast  → bread ;

protein    → crispiness "crispy" "bacon" ;
protein    → "sausage" ;
protein    → cooked "eggs" ;

crispiness → "really" ;
crispiness → "really" crispiness ;

cooked     → "scrambled" ;
cooked     → "poached" ;
cooked     → "fried" ;

bread      → "toast" ;
bread      → "biscuits" ;
bread      → "English muffin" ;


breakfast → protein ( "with" breakfast "on the side" )? | bread ;

protein   → "really"+ "crispy" "bacon" | "sausage" | ( "scrambled" | "poached" | "fried" ) "eggs" ;

bread     → "toast" | "biscuits" | "English muffin" ;

Stuffing an infinite set of strings in a handful of rules is pretty fantastic, but let’s take it further. Our notation works, but it’s tedious. So, like any good language designer, we’ll sprinkle a little syntactic sugar on top—some extra convenience notation. In addition to terminals and nonterminals, we’ll allow a few other kinds of expressions in the body of a rule:

-   Instead of repeating the rule name each time we want to add another production for it, we’ll allow a series of productions separated by a pipe (`|`).
    
    bread → "toast" | "biscuits" | "English muffin" ;
    
-   Further, we’ll allow parentheses for grouping and then allow `|` within that to select one from a series of options within the middle of a production.
    
    protein → ( "scrambled" | "poached" | "fried" ) "eggs" ;
    
-   Using recursion to support repeated sequences of symbols has a certain appealing purity, but it’s kind of a chore to make a separate named sub-rule each time we want to loop. So, we also use a postfix `*` to allow the previous symbol or group to be repeated zero or more times.
    
    crispiness → "really" "really"* ;
    
-   A postfix `+` is similar, but requires the preceding production to appear at least once.
    
    crispiness → "really"+ ;
    
-   A postfix `?` is for an optional production. The thing before it can appear zero or one time, but not more.
    
    breakfast → protein ( "with" breakfast "on the side" )? ;


```
expression     → literal
               | unary
               | binary
               | grouping ;
literal        → NUMBER | STRING;
grouping       → "(" expression ")" ;
unary          → "-" expression ;
binary         → expression operator expression ;
operator       → "+"  | "-"  | "*" | "/"  ;
```






```
expression     → equality ;
equality       → comparison ( ( "!=" | "==" ) comparison )* ;
comparison     → term ( ( ">" | ">=" | "<" | "<=" ) term )* ;
term           → factor ( ( "-" | "+" ) factor )* ;
factor         → unary ( ( "/" | "*" ) unary )* ;
unary          → ( "!" | "-" ) unary
               | primary ;
primary        → NUMBER | STRING | "true" | "false" | "nil"
               | "(" expression ")" ;
```
















=formula( 


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