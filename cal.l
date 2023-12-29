%{
#include <stdio.h>
%}




%%

alpha [A-Za-z]
digit [0-9]
fconst {digit}* "."{digit}+

%%


"if" { printf ("if=>is a keyword.\n");  }
"else" { printf ("else=>is a keyword.\n");  }
"while" { printf ("while=>is a keyword.\n");  }
"int" { printf ("do=>is a keyword.\n");  }
"float" { printf ("float=>is a keyword.\n");  }
"return" { printf ("return=>is a keyword.\n");  }
{alpha}({alpha}|{digit})* { printf ("%s=>is an identifier.\n",yytext);  }
{fconst} { printf ("%s=>is a floating point constant.\n",yytext);  }
"+" { printf ("+=>is an operator.\n");  }
"-" { printf ("-=>is an operator.\n");  }
"*" { printf ("*=>is an operator.\n");  }
"/" { printf ("/=>is an operator.\n");  }
"=" { printf ("==>is an operator.\n");  }
"<" { printf ("<=>is an operator.\n");  }
">" { printf (">=>is an operator.\n");  }
"<=" { printf ("<==>is an operator.\n");  }
">=" { printf (">==>is an operator.\n");  }
"==" { printf ("==>is an operator.\n");  }
"!=" { printf ("!==>is an operator.\n");  }
";" { printf (";=>is a delimiter symbol.\n");  }
"(" { printf ("(=>is a delimiter symbol.\n");  }
")" { printf (")=>is a delimiter symbol.\n");  }
"{" { printf ("{=>is a delimiter symbol.\n");  }
"}" { printf ("}=>is a delimiter symbol.\n");  }
%%
int yywrap()
{
  return 1;
}
int main() {
    printf("Enter input source code ");
    yylex();
    return 0;
}