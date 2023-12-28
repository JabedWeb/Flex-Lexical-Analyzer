%{
#include <stdio.h>
void yyerror(char* s);
int yylex();
%}

%token VOWEL NUMBER Word
%start cal 
%left ADD 
%%

cal : VOWEL {printf("Vowel Printed \n");}
    | NUMBER {printf("Number Printed \n");}
    | Word {printf("Word Printed \n");}
    | cal ADD cal {printf("Addition Printed \n");}
    ;
%%

int main(){
    yyparse();
    printf("Number Printed \n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);

}