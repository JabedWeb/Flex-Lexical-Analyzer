%{
    #include<stdio.h>
    void yyerror(char* s);
    int yylex();
%}

%token NUM DECREMENT ADD NOTEQUAL SUB MUL DIV SEMI ASSIGN ID IF EQUAL WHILE LP RP RCB LCB
%start cal
%left ADD SUB
%left MUL DIV

%%
cal : WHILE LP ID NOTEQUAL NUM RP LCB statement RCB;

statement : ID DECREMENT SEMI
          | ID ASSIGN ID ADD NUM SEMI
          | exp;

exp : exp ADD exp
    | exp SUB exp
    | exp MUL exp
    | exp DIV exp
    | NUM;

%%
int main(){
    yyparse();
    printf("Parsing successful \n");
    return 0;
}

void yyerror(char* s){
    fprintf(stderr,"Error = %s\n",s);
}
