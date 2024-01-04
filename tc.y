%{
#include <stdio.h>
#include <stdlib.h>
extern int line_count;
void yyerror();
int yylex();
%}

%union {
    int num;
    char* sval;
}

%token INCLUDE INT MAIN IF ELSE RETURN SCANF PRINTF LPAREN RPAREN LBRACE RBRACE COMMA SEMICOLON EQ LT ASSIGN MULT NUMBER ID STRING_LITERAL PLUS MINUS ADDRESS


%start program
%left PLUS MINUS
%left MULT
%nonassoc UMINUS  // New line for unary minus

%%
program: INCLUDE INT main_func

main_func: INT MAIN LPAREN RPAREN LBRACE declarations statements RBRACE

declarations: /* empty */
            | declarations declaration

declaration: INT ID SEMICOLON

statements: /* empty */
          | statements statement

statement: assignment_statement
         | if_statement
         | return_statement
         | scan_statement
         | printf_statement

assignment_statement: ID ASSIGN expr SEMICOLON

if_statement: IF LPAREN condition RPAREN LBRACE statements RBRACE
            | IF LPAREN condition RPAREN LBRACE statements RBRACE ELSE LBRACE statements RBRACE

condition: expr EQ expr
         | expr LT expr

return_statement: RETURN expr SEMICOLON

scan_statement: SCANF LPAREN ID COMMA ADDRESS ID RPAREN SEMICOLON

printf_statement: PRINTF LPAREN STRING_LITERAL COMMA ID RPAREN SEMICOLON
              | PRINTF LPAREN STRING_LITERAL COMMA expr RPAREN SEMICOLON

expr: term
    | expr PLUS term
    | expr MINUS term
    | MINUS expr %prec UMINUS  // Specify precedence for unary minus

term: factor
    | term MULT factor

factor: NUMBER
      | ID
      | STRING_LITERAL
      | LPAREN expr RPAREN

%%

int main() {
    yyparse();
    printf("Parsing Completed\n");
}

void yyerror(){
    printf("Sytax Error at line no:%d\n",line_count);
    exit(1);
}
