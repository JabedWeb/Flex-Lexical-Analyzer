%{
#include <stdio.h>
void yyerror(const char *s);
int yylex();
%}

%token INCLUDE STDIO_H UNSIGNED LONG_LONG INT IF RETURN PRINTF SCANF MAIN NUMBER IDENTIFIER
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA ASSIGN ASTERISK MINUS AMPERSAND STRING

%start program

%%

program
    : include_header function_definition main_function
    ;

include_header
    : INCLUDE STDIO_H
    ;

function_definition
    : UNSIGNED LONG_LONG factorial_function
    ;

factorial_function
    : IDENTIFIER LPAREN INT IDENTIFIER RPAREN compound_statement
    ;

main_function
    : INT MAIN LPAREN RPAREN compound_statement
    ;

compound_statement
    : LBRACE statements RBRACE
    ;

statements
    : statement
    | statements statement
    ;

statement
    : type IDENTIFIER SEMICOLON
    | PRINTF LPAREN format_specifier COMMA IDENTIFIER RPAREN SEMICOLON
    | SCANF LPAREN format_specifier COMMA AMPERSAND IDENTIFIER RPAREN SEMICOLON
    | IF LPAREN condition RPAREN RETURN NUMBER SEMICOLON
    | RETURN IDENTIFIER ASTERISK factorial_call SEMICOLON
    ;

factorial_call
    : IDENTIFIER LPAREN IDENTIFIER MINUS NUMBER RPAREN
    ;

type
    : UNSIGNED LONG_LONG
    | INT
    ;

condition
    : IDENTIFIER ASSIGN NUMBER
    ;

format_specifier
    : STRING
    ;

%%
int main() {
    yyparse();
    printf("program is syntactically correct\n");
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

