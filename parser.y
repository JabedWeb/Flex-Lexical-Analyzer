%{
#include <stdio.h>
void yyerror(const char *s);
int yylex();
%}

%token INCLUDE TYPE VOID MAIN PRINTF SCANF BREAK CONTROL ID NUMBER  SEMICOLON ARITHMETIC LEFT_PAREN RIGHT_PAREN CHAR STRING COMMA BITWISE CASE COLON RETURN LOGICAL CONTINUE
WS RELATIONAL ASSIGN INCREMENT  ERROR

%start program 

%%

program
    : INCLUDE calculator main
    ;

calculator
    : VOID ID LEFT_PAREN RIGHT_PAREN compound_statement
    ;

compound_statement
    : LEFT_PAREN statement_list RIGHT_PAREN
    ;

statement_list
    : statement
    | statement_list statement
    ;

statement
    : variable
    | printf
    | scanf
    | switch_statement
    | return_statement
    ;
return_statement
    : RETURN NUMBER SEMICOLON
    ;

variable
    : TYPE ID SEMICOLON
    | TYPE ID COMMA ID SEMICOLON
    ;

printf
    : PRINTF LEFT_PAREN STRING RIGHT_PAREN SEMICOLON
    ;

scanf
    : SCANF LEFT_PAREN STRING COMMA BITWISE ID COMMA BITWISE ID COMMA BITWISE ID RIGHT_PAREN SEMICOLON
    ;

switch_statement
    : CONTROL LEFT_PAREN ID RIGHT_PAREN LEFT_PAREN case_list RIGHT_PAREN
    ;

case_list
    : case_clause
    | case_list case_clause
    ;

case_clause
    : CASE STRING COLON printfN
    ;

printfN
    : PRINTF LEFT_PAREN STRING COMMA ID ARITHMETIC ID RIGHT_PAREN SEMICOLON BREAK SEMICOLON
    ;

main
    : TYPE MAIN LEFT_PAREN RIGHT_PAREN compound_statement
    ;

%%

int main() {
    yyparse();
    printf("Parsing Successful\n");
    return 0;
}

void yyerror(const char *s) {
    extern int yylineno; // Provided by Flex
    extern char *yytext; // Provided by Flex
    fprintf(stderr, "Error: %s at line %d near '%s'\n", s, yylineno, yytext);
}
