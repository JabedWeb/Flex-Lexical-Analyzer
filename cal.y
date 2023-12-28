%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char* s);
int yylex();
%}

%token NUM ADD SUB MUL DIV ID ASSIGN SEMI
%start cal
%left ADD SUB
%left MUL DIV
/* 2+3-5=0 */

%%

cal: exp {printf("Final Result: %d\n", $1); }
    ;

exp : exp ADD term { printf("exp+term: %d\n", $1 + $3); $$ = $1 + $3; }
    | exp SUB term { printf("exp-term: %d\n", $1 - $3); $$ = $1 - $3; }
    | term { $$ = $1; }
    ;

term: term MUL factor { printf("term*factor: %d\n", $1 * $3); $$ = $1 * $3; }
    | term DIV factor { printf("term/factor: %d\n", $1 / $3); $$ = $1 / $3; }
    | factor { $$ = $1; }
    ;

factor: NUM { printf("factor->num: %d\n", $1); $$ = $1; }
    ;

%%

int main(){
    yyparse();
    printf("Parsing Successful\n");
    return 0;
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s\n", s);
}
