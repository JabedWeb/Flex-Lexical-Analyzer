%{
#include <stdio.h>
void yyerror(char* s);
int yylex();
/*Input
for(int i = 2 ; i < 5; i++){
	x = x + x;
	y = y & y;
}
   */
%}

%token keyword LP Type ID ASSIGN NUM SEMI Gre ADD RP LB And RB 
%start cal 
%left ADD 
%%

cal: keyword LP Type exp SEMI exp SEMI ID ADD ADD RP LB id_dec id_dec RB 
    ;
id_dec: ID ASSIGN exp SEMI|exp
        ;
exp : ID ADD ID
    | ID And ID
    | ID ASSIGN NUM
    | ID Gre NUM
    | NUM  
    | ID
    ;
%%

int main(){
    yyparse();
    printf("Parsing Successful ForLoop\n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);

}