main :cal.y test.l
	yacc -d cal.y
	lex test.l
	gcc cal.tab.c lex.yy.c
	a<input.txt> output.txt