## Apelang

This is going to be using lex, and yacc in order to write a langauge.

``lex
// imports
FIRST PART
%%
pattern action // regexp
// regex c-statement
%%
// c code which is used as is, define funcs here
THIRD PART
``

## Using our current impl

First of all, we can compile our lex file using `lex apelang.l` which produces a a.out file
this file when run acts as somewhat of an interpreter for stdout, using unix we can pipe in
a file using the `<` operator so with `./a.out < file.txt` we can run the code in file.txt
as defined by our grammer in apelang.l.

## Note on run.sh

Yes this is hyper scuffed, I understand that this is omega trash, I will make this a makefile 
at somepoint but right now it's a shell script with everything hardcoded :( deal with it omegalol.
