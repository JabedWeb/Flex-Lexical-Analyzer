%{
#include "factorial.tab.h"
%}

%option noyywrap

%%

"#include"                   { return INCLUDE; }
"<stdio.h>"                  { return STDIO_H; }
"unsigned"                   { return UNSIGNED; }
"long long"                  { return LONG_LONG; }
"int"                        { return INT; }
"if"                         { return IF; }
"return"                     { return RETURN; }
"printf"                     { return PRINTF; }
"scanf"                      { return SCANF; }
"main"                       { return MAIN; }
[0-9]+                       { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*       { return IDENTIFIER; }
"("                          { return LPAREN; }
")"                          { return RPAREN; }
"{"                          { return LBRACE; }
"}"                          { return RBRACE; }
";"                          { return SEMICOLON; }
","                          { return COMMA; }
"="                          { return ASSIGN; }
"*"                          { return ASTERISK; }
"-"                          { return MINUS; }
"&"                          { return AMPERSAND; }
\"[^\"]*\"                   { return STRING; }
[ \t\n]+                     { }
.                            { }

%%
