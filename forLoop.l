%option noyywrap
%{
   #include "cal.tab.h"
%}
delim [ \t\n]
ws {delim}+
digit [0-9]
number ({digit}+)
letter [A-Za-z]
us [_]
id ({us}|{letter})({letter}|{us}|{digit})*
%%
{ws} {}
{number} {yylval = atoi(yytext); return(NUM);}
"for" {return(keyword);}
"int" {return(Type);}
{id} {return(ID);}
"&" {return(And);}
"<" {return(Gre);}
"(" {return(LP);}
")" {return(RP);}
"{" {return(LB);}
"}" {return(RB);}
"=" {return(ASSIGN);}
";" {return(SEMI);}
"+" { return(ADD); }

%%