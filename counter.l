%{
// Este codigo se copia directamente
int line_num = 1;  int num_lines = 0, num_chars = 0;
%}
%%
\n	++num_lines; ++num_chars;  // Incrementa el numero de lineas y la cantidad de cars
.   ++num_chars; // Incrementa la cantidad de caracteres.
%%

/**
 * yywrap es la funcion que permite que una vez que se alcanza el EOF de la
 * entrada estandar se vuelva a procesar otra cosa.  Si se retorna 1 es porque
 * se indica al programa que termine.
 **/
int yywrap(void){
    return 1;
}

int main(int argc, char *argv[])
{
  // YYlex es la funcion que arranca todo el motor de procesamiento, tomando
  // una a una la entrada.
  yylex();
  printf("# of lines = %d, # of chars = %d\n", num_lines, num_chars);
}
