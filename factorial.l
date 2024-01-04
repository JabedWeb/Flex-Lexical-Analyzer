%{
#include "factorial.tab.h"
#include<string.h>
%}

%option noyywrap

digit       [0-9]
number      {digit}+
ws          [ \t\n]+
id          [a-zA-Z_][a-zA-Z0-9_]*
%%
"unsigned"              { return UNSIGNED; }
\"[^\"]*\"                { return STRING; }
"long"                  { return LONG; }
"int"                   { return INT; }
"if"                    { return IF; }
"return"                { return RETURN; }
"else"                  { return ELSE; }
"printf"                { return PRINTF; }
"scanf"                 { return SCANF; }
"main"                  { return MAIN; }
{id}                    { yylval.str = strdup(yytext); return ID; }
{number}                { yylval.num = atoi(yytext); return NUMBER; }
";"                     { return SEMICOLON; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
"{"                     { return LBRACE; }
"}"                     { return RBRACE; }
","                     { return COMMA; }
"="                     { return ASSIGN; }
"*"                     { return ASTERISK; }
"-"                     { return MINUS; }
"&"                     { return AMPERSAND; }
{ws}                    { /* ignore whitespace */ }
.                       { /* catch all for other characters */ }
%%

