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