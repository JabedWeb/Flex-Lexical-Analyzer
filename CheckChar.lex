%{
#include <stdio.h>
%}

%%

[a,e,i,o,u,A,E,I,O,U] {
    printf("%s is a vowel.\n", yytext);
}

[0-9]+ {
    printf("%s is a digit.\n", yytext);
}

[A-Za-z]+ {
    printf("%s is a word.\n", yytext);
}

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

/* flex word.lex
gcc lex.yy.c
./a

*/


/*
Go to Terminal -> Configure Tasks -> Create tasks.json file from template -> Others. This will create a tasks.json file.
{
    "version": "2.0.0",
    "tasks": [
       {
          "label": "Build and Run Flex",
          "type": "shell",
          "command": "flex ${fileBasename} && gcc lex.yy.c && ./a",
          "group": {
             "kind": "build",
             "isDefault": true
          }
       }
    ]
 }
*/