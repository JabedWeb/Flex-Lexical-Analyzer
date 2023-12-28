%option noyywrap
%{
   #include "cal.tab.h"
%}
delim [\t]
ws {delim}+
digit [0-9]
number ({digit}+)
letter [A-Za-z]
us [_]
id ({us}|{letter})({letter}|{us}|{digit})*
%%
{ws} {}
{number} {yylval = atoi(yytext); return(NUM);}
{id} {return(ID);}
"="  {return(ASSIGN);}
";"  {return(SEMI);}
"+" { return(ADD); }
"-" {return(SUB); }
"*" { return(MUL); }
"/" {return(DIV); }
%%