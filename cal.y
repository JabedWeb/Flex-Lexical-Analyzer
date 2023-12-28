%{
#include <stdio.h>
void yyerror(char* s);
int yylex();
/*Input
   A % 2 == 4
   */

%}

%token NUM ADD SUB MUL DIV ID ASSIGN SEMI MODD EQ
%start cal 
%left ADD SUB
%left MUL DIV MODD
%%

cal: ID MODD NUM EQ NUM
    ;
%%
int main(){
    yyparse();
    printf("task_1 Done Parsing Successful\n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);
}