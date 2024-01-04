main: cal.l cal.y
	yacc -d cal.y
	lex cal.l
	gcc cal.tab.c lex.yy.c
	a <input.txt> output.txt

lexical: lexical.l
	lex lexical.l
	gcc lex.yy.c
	a <input.txt> output.txt	

syntax: syntax.y
	yacc -d syntax.y
	lex syntax.l
	gcc y.tab.c lex.yy.c
	a <input.txt> output.txt

tc: tc.y
	yacc -d tc.y
	lex tc.l
	gcc tc.tab.c lex.yy.c
	a <input.txt> output.txt

lexer: lexer.l parser.y
	yacc -d parser.y
	lex lexer.l
	gcc parser.tab.c lex.yy.c
	a <input.txt> output.txt	

factorial: factorial.l factorial.y
	yacc -d factorial.y
	lex factorial.l
	gcc factorial.tab.c lex.yy.c
	a <input.txt> output.txt	
