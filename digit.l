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
