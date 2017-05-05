%{
    
// Basic and very simple grammar of an adder program.
    



// All the headers that you put here will be added to the output C file on top.

#include <stdio.h>
#include <string.h>


void assdf(char *line);
void assm(char *line);


// The next Section is the Token definitions.  All of them will be DEFINE in y.tab.h

%}

%token SEMICOLON;
%token NUMBER;
%token DOT;
%token OUTPUT;


%start program
%%

// Each block is executed once the production is applied.

program : statements

            {
                // This is the typical output sequence to return to the operating system.
                // The return value is stored into ebx (2 in this case)
                assm("push dword 0");
                assm("mov  eax, 1");
                assm("mov  ebx, 2");
                assm("int  80h");
            
                // The following is Section data where you define memory blocks in assembler
                assdf("section .data");
                assdf("mymsg    db    \"---------\", 0xa");
                assdf("z        dd    100000");
            }
            ;

statements : statement DOT
            {
                assm("mov  dword[z], eax");
                assm("add  dword[z], 48");
                
                // Typical call to OS Syscall to send data to STDOUT.
                assm("push dword 1");    // Len of message
                assm("push dword z");    // Message (the variable z)
                assm("push dword 1");    // STDOUT (Filedescriptor 1)
                assm("call _write");     // Execute the _write routine (defined somewhere)
                assm("add  esp,12");     // Clear the stack
            }
           | statement SEMICOLON statements;
		   
statement	: NUMBER
			{
				// $1 is just the value assigned to NUMBER
				printf("add 	eax, %d \n", $1);
			}
			| OUTPUT
			{
                // Show a fixed hardcoded message.
                assm("push dword mylen");    // Len of message
                assm("push dword mymsg");    // Message (the variable z)
                assm("push dword 1");    // STDOUT (Filedescriptor 1)
                assm("call _write");     // Execute the _write routine (defined somewhere)
                assm("add  esp,12");     // Clear the stack
			}
			;

%%

void assm(char *line)
{
    printf("\t%s\n", line);
}

void assdf(char *line)
{
    printf("%s\n", line);
}

int yywrap()
{
        return 1;
} 
  
main()
{

	// Start program sequence in assembler.
    assdf("section .text");
    
    assdf("global _start                ; make the main function externally visible");
    
    assm("; a procedure wrapping the system call to write");
    assdf("_write:");
    assm("mov eax, 0x4              ; system call write code");
    assm("int 0x80                  ; make system call");
    assm("ret\n");
    
    assdf("; a procedure wrapping the system call to exit");
    assdf("myexit:");
    assm("mov eax, 0x1              ; system call exit code");
    assm("int 0x80                  ; make system call");
    assm("; no need to return");
    
    assdf("_start:");
    
    assm("mov  eax, 0");

	
	// the Assembler program will start based on the rules execution from the LALR parser.

    // Start the Parsing (yacc)
    yyparse();
} 

