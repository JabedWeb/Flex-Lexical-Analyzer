%option noyywrap
%{
#include <stdio.h>
#include <parser.tab.h>
    int line_count=1
   void yyerror();
%}

delim [ \t\n]       
ws {delim}+
digit [0-9]
number ({digit}+)
letter [A-Za-z]
us [_]
id ({letter}|{us})({letter}|{us}|{digit})*
fconst {digit}* "."{digit}+
%%
"#include".*              { return INCLUDE; }
"int"|"char"|"float"|"double"     { return TYPE; }
"void"                    { return VOID; }
"main"                    { return MAIN; }
"printf"                  { return PRINTF; }
"scanf"                   { return SCANF; }
"break"                   { return BREAK; }
"continue"                { return CONTINUE; }
"return".*                { return RETURN; }
"for"|"while"|"if"|"else"|"switch"|"default" { return CONTROL; }
"case"                    { return CASE; }
{id}                      { return ID; }
{number}                  { return NUMBER; }
{fconst}                  { return FCONST; }
{ws}                      { return WS; }
"&&"|"||"                 { return LOGICAL;  }
"&"|"|"|"^"|"~"           { return BITWISE; }

"=="|"!="|"<"|"<="|">"|">=" { return RELATIONAL; }
"="                       { return ASSIGN; }
":"                       { return COLON; }
";"                       { return SEMICOLON; }
"+"|"-"|"*"|"/"            { return ARITHMETIC; }
","                       { return COMMA; }
"++"|"--"                  { return INCREMENT; }
"("|"{"                    { return LEFT_PAREN; }
")"|"}"                    { return RIGHT_PAREN; }
"'"([^']*)"'"             { return CHAR; }
\"[^\"]*\"                { return STRING; }
.                        {yyerror("Uneconginized Character");}
%%
