%{
#include <stdio.h>
%}

%option noyywrap

%%
"#include".*              { printf("Preprocessor Directive: %s\n", yytext); }
"int"|"char"|"float"      { printf("Keyword: %s\n", yytext); }
"void"                    { printf("Void Keyword: %s\n", yytext); }
"main"                    { printf("Main Function: %s\n", yytext); }
"printf"                  { printf("Print Function: %s\n", yytext); }
"scanf"                   { printf("Scan Function: %s\n", yytext); }
"break"                   { printf("Break Statement: %s\n", yytext); }
"continue"                { printf("Continue Statement: %s\n", yytext); }
"return".*                { printf("Return Statement: %s\n", yytext); }
"for"|"while"|"if"|"else"|"switch"|"default" { printf("Control Statement: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*    { printf("Identifier: %s\n", yytext); }
[0-9]+                    { printf("Integer Constant: %s\n", yytext); }
[0-9]+\.[0-9]+            { printf("Floating Point Constant: %s\n", yytext); }
"=="|"!="|"<"|"<="|">"|">=" { printf("Comparison Operator: %s\n", yytext); }
"="                       { printf("Assignment Operator: %s\n", yytext); }
";"                       { printf("Semicolon: %s\n", yytext); }
"+"|"-"|"*"|"/"            { printf("Arithmetic Operator: %s\n", yytext); }
"++"|"--"                  { printf("Increment/Decrement Operator: %s\n", yytext); }
"("|"{"                    { printf("Left Parenthesis/Curly Brace: %s\n", yytext); }
")"|"}"                    { printf("Right Parenthesis/Curly Brace: %s\n", yytext); }
"'"([^']*)"'"             { printf("Character Constant: %s\n", yytext); }
\"[^\"]*\"                { printf("String Literal: %s\n", yytext); }
[ \t\n]+                  { /* Ignore whitespace and newlines */ }
.                         { printf("Unrecognized Token: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}