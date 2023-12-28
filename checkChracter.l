// Header Part 
// Production and Rule part 
// Main Function

//the target of .l file is to generate the .tab.c file

%option noyywrap // no need to use yywrap() function

%{
    #include "checkChar.tab.h" // include the header file
%}

delim [ \t\n] // define the delimiter as space, tab and new line
ws {delim}+ // define the white space as one or more than one delimiter 
digit [0-9] // define the digit as 0 to 9
letter [a-zA-Z] // define the letter as a to z and A to Z
number {digit}+ // define the number as one or more than one digit
us [_] // define the underscore as _
id {letter}({letter}|{digit}|{us})* // define the identifier as letter followed by letter or digit or underscore

%%
{ws} // ignore the white space
{number} {yylval = atoi(yytext); return NUMBER;} // return the token NUMBER
{id} {return (ID);} // return the token ID
"+" {return (PLUS);} // return the token PLUS
"-" {return (minus);}
"*" {return (MULTIPLY);}
"/" {return (DIVIDE);}
"=" {return (EQUAL);}
%% 

// 