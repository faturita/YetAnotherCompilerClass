all:
	yacc -d grammar.y
	lex lex.l
	gcc -o parser lex.yy.c y.tab.c -ly
compile:
	./parser < myprogram.py > output.asm
	nasm -f macho -o program.o output.asm
	ld -arch i386 -macosx_version_min 10.6 -no_pie -e _start -o program program.o
clean:
	rm -f program.o
	rm -f program
	rm -f output.asm
