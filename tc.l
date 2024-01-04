%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>  // Add this line for strdup
#include "tc.tab.h"
 int line_count=1;
 void yyerror();
%}

%option noyywrap

digit [0-9]
num ({digit}+)
letter [A-Za-z]
us [_]
id ({us}|{letter})({letter}|{us}|{digit})*
WS [ \t]+

%%

{WS}                  {} /* Ignore whitespace */
"#include <stdio.h>"   { return INCLUDE; }
"int"                 { return INT; }
"main"                { return MAIN; }
"if"                  { return IF; }
"else"                { return ELSE; }
"return"              { return RETURN; }
"scanf"               { return SCANF; }
"printf"              { return PRINTF; }
"("                   { return LPAREN; }
")"                   { return RPAREN; }
"{"                   { return LBRACE; }
"}"                   { return RBRACE; }
","                   { return COMMA; }
";"                   { return SEMICOLON; }
"=="                  { return EQ; }
"<"                   { return LT; }
"\n"                  {line_count +=1;}
"="                   { return ASSIGN; }
"*"                   { return MULT; }
"-"                   { return MINUS; }
"+"                   { return PLUS; }
"&"                   { return ADDRESS; }
\"([^\"\\]|\\.)*\"     { yylval.sval = strdup(yytext); return STRING_LITERAL; } // String literal
{id}                  { yylval.sval = strdup(yytext); return ID; } // Identifier
{num}                 { yylval.num = atoi(yytext); return NUMBER; } // Integer constant
.                     { printf("Unrecognized Token: %s\n", yytext); }

%%
