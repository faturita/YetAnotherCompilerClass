all:
	yacc -d looping.y
	lex looping.l
	gcc -o looping lex.yy.c y.tab.c -ly
