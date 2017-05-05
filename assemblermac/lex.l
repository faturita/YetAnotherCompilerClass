%{
#include "y.tab.h"
%}

%%

[0-9]+	yylval=atoi(yytext); return NUMBER;
;		return SEMICOLON;
[ \t]+	/* ignore whitespace */;
.		return DOT;
output	yylval=0;return OUTPUT;

%%