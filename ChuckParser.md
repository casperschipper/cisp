# My Chuck Tools

## Writing Lexer, Parser and Compilers

### Lexer

A lexer is a state machine that goes through a program text letter for letter and returns tokens.
A token can be for example '=', '+', '*', seq, '(' etc... . The tokens are than interpreted by an interpreter.
Digits like 12 , 134, 1024 are interpreted as a group and turned into a integer.

Tokens have two fields, their type and their value.

### Parser

A parser is based on the grammer of programming language. It asks the Lexer for the next token using a Grammar to structure it into an AST tree.

As an example lets look at a simple calculator language, it simply represents strings like:
1 + 3 * (3 + 5 * 2) - (3 * 4 + (1 + 4 - (3 * 2))) / 44

* fact -> INTEGER | LPAR expr RPAR  
* term -> fact ((MUL|DIV) fact)*   
* expr -> term ((PLUS|MINUS) fact)*  

The hierarchy makes sure that multiplication has higher precendence than summing for example.
So __12 - 3 * 4__ is actually: __12 - (3 * 4)__

12 + 3 * 4

	    +
	12     *
		3     4
    

 

