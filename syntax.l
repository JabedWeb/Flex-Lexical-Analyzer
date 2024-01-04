%{
#include <stdio.h>
void yyerror(char* s);
int yylex();
/*Input
#include <stdio.h>

int countVowels(char *str) {
    int count = 0;
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] == 'a' || str[i] == 'e' || str[i] == 'i' || str[i] == 'o' || str[i] == 'u' ||
            str[i] == 'A' || str[i] == 'E' || str[i] == 'I' || str[i] == 'O' || str[i] == 'U') {
            count++;
        }
    }
    return count;
}

int main() {
    char inputString[100];
    printf("Enter a string: ");
    scanf("%s", inputString);
    int result = countVowels(inputString);
    printf("Number of vowels in the string: %d\n", result);
    return 0;
}

   */
%}

%token NUMBER FLOAT IDENTIFIER INCLUDE TYPE RETURN CONTROL ASSIGN COMPARE OPERATOR INCREMENT LOGIC OPEN CLOSE SEMICOLON PRINT SCAN MAIN VOID CHAR STRING
%start cal 
%left ADD 
%%
cal: INCLUDE TYPE IDENTIFIER OPEN

int main(){
    yyparse();
    printf("Parsing Successful ForLoop\n");
}

void yyerror(char* s){
    fprintf(stderr, "Error= %s", s);
}