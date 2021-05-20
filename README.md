# Yet Another Compiler Class
Tools, utilities and samples of Lex and Yacc stuff.

# How to use me

```bash
# flex whatever.l && gcc lex.yy.c -o a.out
# ./a.out < yourinputfile
```

# Contents

* Root directory show sample LEX .l files.
* [Language and Compilers](LanguagesAndCompilers.md)

# How to generate IR code from a C file.

IR code can be used to generate fast and efficient intermediate representation code that can be compiled to several different architectures.

```bash
# clang -emit-llvm -S sample.c -o sample.ir
# clang -x ir sample.ir -o sample
```


(Found an error? do u want to add something? something extra? -> fork-me and send a pull-request!)




