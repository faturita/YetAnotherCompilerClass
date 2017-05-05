%{
int line_num = 1; 
%}
%x comment
%option noyywrap
%%

"/*"         BEGIN(comment);
<comment>[^*\n]*        /* eat anything that's not a '*' */
<comment>"*"+[^*/\n]*   /* eat up '*'s not followed by '/'s */
<INITIAL>\n             ++line_num;
<comment>"*"+"/"        BEGIN(INITIAL);
%%

int main(int argc, char *argv[])
{
  yylex();
  printf("# of lines = %d\n", line_num);
}
