%%
[\n\t ]			;

-?(([0-9]+)|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?)	{printf("Numero\n");}
.				ECHO ;
%%
int yywrap(void){
    return 1;
}

int main(int argc, char *argv[])
{
	printf ("Identifica cualquier notacion válida para números (incluyendo científca)");
	yylex();
	return 0;
}
