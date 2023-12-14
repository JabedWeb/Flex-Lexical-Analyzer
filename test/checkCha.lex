${
    #include <stdio.h>
%}

%%
[aeiouAEIOU] {printf("%c=> is a vowel .\n",yytext[0])}
