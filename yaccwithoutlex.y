%{
#include <ctype.h>
int yydebug=1;


%}

%token DIGITO
%start linea

%%

linea   :   expr    '\n'                { printf("Result: %d\n", $1);}
        ;
expr    :   expr    '+'     termino     { $$ = $1 + $3; }
        |   termino
        ;
termino :   termino '*'     factor      { $$ = $1 * $3; }
        |   factor
        ;
factor  :   '('     expr    ')'         { $$ = $2;  }
        |   DIGITO
        ;
    
%%
int yylex() {
    int c;
    c = getchar(c);
    if (isdigit(c)) {
        yylval = c - '0';
        return DIGITO;
    }
    return c;
}