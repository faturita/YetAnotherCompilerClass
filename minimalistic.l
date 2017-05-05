%%
.|\n  // Esta regla ilustra que el punto no incluye en ASCII 10 (el enter) entonces hay que agregarlo explicitamente.
%%
int yywrap(void){
    return 1;
}
int main(void){
    printf("Estaría rechazando todo lo que me mandan....");
    yylex();
    return 0;
}
