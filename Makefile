main: cal.l cal.y
	yacc -d cal.y
	lex cal.l
	gcc cal.tab.c lex.yy.c
	a <input.txt> output.txt