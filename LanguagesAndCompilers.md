# Compilers

<p align="center">
    <img alt="node-express-starter" width="60%" height="auto" src="./images/computer_science_major.png" />
</p>

```quote
The art of telling another human being what one wants the computer to do.  Donald Knuth
```

Let's start with this awesome introduction of what a compiler is [A Compiler From Scratch](https://www.destroyallsoftware.com/screencasts/catalog/a-compiler-from-scratch).   This is not from the traditional perspective of a compiler as a translation machine based on a particular type of lexical analyzer.

[Why do we need new languages ?](https://spectrum.ieee.org/view-from-the-valley/computing/hardware/david-patterson-says-its-time-for-new-computer-architectures-and-software-languages)

[Do we need a replacement for C](https://erik-engheim.medium.com/do-we-need-a-replacement-for-c-3256a8b44814)

# Compiler Components

## Abstract Syntax Tree

The abstract syntax tree is the tree constructed by the parser to identify if a word belongs or not to the language produced by a grammar.  If a valid unambiguos tree, that spans from the distinguished symbol all the way down to all the terminals, can be constructed then the word is accepted.  A compiler needs a concrete way to create this abstract syntax tree.  At the same time, a compiler can create the abstract syntax tree in the first scan of the input program, without bothering on how to translate that into machine or intermediate code.  At a second round, it can easily traverse the abstract syntax tree to produce the output translated code.  The Abstract Syntax Tree allows to disentangled these two tasks and eases the cretion of effective compilers (albeit they will be slower).

## Semantic Analysis

The compiler needs to extract the semantic meaning of the program sentences.  Does it mean a variable ? an operation ? To do that, Attributes Grammars comes handy and allows to propagate meaning across the syntax tree.

## Table of Symbols

The table of symbols allows to handle the existence of different identifiers like variables or function names.  It allows to check of the existence of variables, to check if they are not duplicates, to handle their memory allocation, and so on.

## Runtime Environment

The runtime environment is a key component of the Compiler and lives in the intersection of the compiler with the running operating system and platform. 

## Linking

Related witht he runtime environment is the issue of linking with libraries, static or dynamic libraries.  This is a hug topic in operating systems as well.  Do we have to ship all the running code without sharing the stuff that is duplicated ?  Some time ago, the industry realized that was a bad idea and libraries were created for that.  Recently this idea has been challenged and containers are dominating the production stage (everything bundled inside a single file).


## Memory Management

What to do and how to handle the Memory is almost the most important task a programming language has to deal with.  And of course, this is part of the compiler.

## Intermediate Language: IL, Abstract Stack Machine, Three Address Codes

There are several ways to generate intermediate code that helps to generate, step by step, the final product of a compiler which is code that can run on a machine.

## Target Language: Assembler, Object

After several steps, a compiler needs to generate actual machine code that can run on a processor.  Is it going to be mnemonic assembler ?  Machine code ?  Actual binary ?


# What kind of new languages can be created ?

## Processing 

Languages to create programatically GUIs.

## Minifications

Minification is a key component of modern Web Dev.  A language could have minification (and obfuscation) in its foundations.


## Short languages
Many international programming competitions like IEEE eXtreme asks developers to produce good code, very fast.  To do that, we need languages that reduce the verbosity and allows very flexible boilerplate to produce code as quick as possible, mixing interactive and traditional mode.


## Modern programming languages

https://betterprogramming.pub/modern-languages-suck-ad21cbc8a57c

## Design Pattern Language

Instead of having a language, and create desing patterns on it, let's create a language that incorporates all the available design patterns into their core.

## Metaprogramming

There should be possible to create a generic language to create other languages (YACC?).


## Parse JSON like a pro

https://nee.lv/2021/02/28/How-I-cut-GTA-Online-loading-times-by-70/

## OTC

A very small compiler in C: https://bellard.org/otcc/

## Python

Why is python so successful ??

https://towardsdatascience.com/why-python-is-not-the-programming-language-of-the-future-30ddc5339b66

TL;DR: Dynamic type and block linking.

## RUST

Rust a growing language that has the goal to replace C.

https://hackaday.com/2015/12/18/programming-with-rust/
https://stackoverflow.blog/2020/06/05/why-the-developers-who-use-rust-love-it-so-much/

## DSL

These are Domain Specific Languages, which are not General Purpose Languages (C, Java, etc).

https://dl.acm.org/doi/10.1145/2692916.2557966
https://dl.acm.org/doi/10.1007/s10664-011-9172-x

## Scala, Bytecode and JVM

https://www.toptal.com/scala/scalabytecode-and-the-jvm


## Interpreter Creation

Interpreters are compiler with big runtimes.

https://ruslanspivak.com/lsbasi-part

## Graal and Truffle

Graal and Truffle is a very interesting project aimed to understand languages, and compilers, from a totally different perspective

 https://blog.plan99.net/graaltruffle-134d8f28fb69#.wwjmzbg2o

## Racket
Racket is a hyperlanguage that can be tailored to generate many other languages.  It generalize many language features that are very good to serve as inspiration.  Additionally, Racket authors provide a very wide set of tools for compiler creation.

https://www.racket-lang.org/

# YACC

YACC stands for Yet Another Compiler Compiler, and it is a tool to generate a compiler given a grammar in Backus-Naur Form (BNF).  What this tool does, is pick all the grammar productions and generate an LALR(1) parser that will recognize words to belong to that grammar.  These words are the programs that we want the compilar to parse.  Additionally, BNF allows you to encode semmantic rules attached to each production that will be executed each time the production is reduced (identify the left part of the production and replace it with the right part).  These rules can be used to implement a syntax directed transalator that will transform the original program into something different, may be a runnable executable.   Yacc works in coordination with Lex, another tool from the 70s that helps to implement scanners to identify lexical tokens (reserved words):  https://www.youtube.com/watch?v=yTXCPGAD3SQ


# Must See

* LLVM Tutorial:  https://llvm.org/docs/tutorial/LangImpl03.html
* LL and LR explained: o http://blog.reverberate.org/2013/07/ll-and-lrparsing-demystified.html
* Programming Languages Blog: http://lambda-the-ultimate.org
* Yacc is dead: https://arxiv.org/abs/1010.5023



# Books

* Lex and Yacc, Levine, 20xx
* Programming Languages Pragmatic, Scott, 2009
* Model Compiler Design, Grune, 2012
* Practical Foundations for Programming Languages, Herper, 2013
* Programming Languages Application and Interpretation, Krishnamurthi, 2012
* Hacker's Delight, Warren, 2003
