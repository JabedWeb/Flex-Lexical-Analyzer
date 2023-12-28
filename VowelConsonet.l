%{
#include <stdio.h>
%}

%%

[AEIOUaeiou]   { printf("%c is a Vowel.\n", yytext[0]); }
[BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz]   { printf("%c is a Consonant.\n", yytext[0]); }
.   { printf("%c is not an Alphabetic character.\n", yytext[0]); }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}