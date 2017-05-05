%%
.				ECHO;   //Copia culaquier cosa que ingresa.
[\n\t ]			;   //Ignora los tabs y enters, es decir no los manda a la salida
%%
int yywrap(void){
    return 1;
}
int main(void){
    yylex();
    return 0;
}
