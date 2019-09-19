%{
int line_num = 0;

// La opcion noyywrap es requerida en Mac para que no obligue a completar la funcion yywrap

// Este programa cuenta los numeros de linea.  Sin embargo no cuenta los numeros de linea que estan
// de los comentarios.

// Ojo que si cuenta los numeros de linea donde estan los finales de los comentarios

%}
%x comment
%option noyywrap
%%

"/*"         BEGIN(comment);
<comment>[^*\n]*        /* eat anything that's not a '*' */
<comment>"*"+[^*/\n]*   /* eat up '*'s not followed by '/'s */
<INITIAL>\n             {printf(".");line_num++;}
<comment>"*"+"/"        BEGIN(INITIAL);
%%

int main(int argc, char *argv[])
{
  yylex();
  printf("\n# of lines = %d\n", line_num);
}
