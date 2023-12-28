%{
#include <stdio.h>
%}

%%

[A-Za-z]+   { printf("%s is a Word.\n", yytext); }
[0-9A-Za-z]+ { printf("%s is not a valid Word.\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}