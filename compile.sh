yacc -d yaccwithoutlex.y
gcc -o yaccwithoutlex y.tab.c -ly
