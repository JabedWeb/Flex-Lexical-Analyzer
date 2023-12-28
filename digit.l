%{
#include <stdio.h>
%}

%%

[0-9]   { printf("%c is a digit.\n", yytext[0]); }
.       { printf("%c is not valid digit.\n", yytext[0]); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}







%option noyywrap
%{
   #include "cal.tab.h"
%}

%%
[a,e,i,o,u,A,E,I,O,U] {
   return VOWEL;
}

[0-9]+ {
   yylval = atoi(yytext);
   return NUMBER;
}

[A-Za-z]+ {
   return Word;
}

[ \t\n] {
   /* ignore whitespace */
}
%%