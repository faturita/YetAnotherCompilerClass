%option noyywrap

%% 
"alfa"		putchar('a');
"alfabeto" 	printf("de la ‘a’ a la ‘z’");
%%
int main(int argc, char *argv[])
{
  yylex();
}
