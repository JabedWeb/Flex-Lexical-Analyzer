%{
#include <stdio.h>
void yyerror(const char *s);
int yylex();
%}

%union {
    int num;
    char* str;
}

%token UNSIGNED LONG INT IF RETURN ELSE PRINTF SCANF MAIN STRING
%token <num> NUMBER
%token <str> ID
%token SEMICOLON LPAREN RPAREN LBRACE RBRACE COMMA ASSIGN ASTERISK MINUS AMPERSAND

%%

program
    : function MAIN LPAREN RPAREN compound_statement
    ;

function
    : UNSIGNED LONG LONG ID LPAREN INT ID RPAREN compound_statement
    ;

compound_statement
    : LBRACE statement_list RBRACE
    ;

statement_list
    : statement
    | statement_list statement
    ;

statement
    : IF LPAREN condition RPAREN RETURN NUMBER SEMICOLON
    | RETURN ID ASTERISK function_call SEMICOLON
    | declaration
    | printf_call
    | scanf_call
    ;

condition
    : ID ASSIGN NUMBER
    ;

function_call
    : ID LPAREN ID MINUS NUMBER RPAREN
    ;

declaration
    : INT ID SEMICOLON
    | INT ID ASSIGN function_call SEMICOLON
    ;

printf_call
    : PRINTF LPAREN STRING COMMA ID COMMA ID RPAREN SEMICOLON
    ;

scanf_call
    : SCANF LPAREN STRING COMMA AMPERSAND ID RPAREN SEMICOLON
    ;

%%

int main() {
    yyparse();
    printf("Parsing complete\n");
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
