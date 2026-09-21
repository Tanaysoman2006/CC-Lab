%{
#include <stdio.h>
#include <string.h>

int count = 0;
%}

%%

[A-Za-z]+ {
    if (yytext[0] == 'A' || yytext[0] == 'a')
        count++;
}

[ \t\n]+    ;
.           ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the input (Press Ctrl+D to stop):\n");
    yylex();

    printf("\nWords starting with A/a = %d\n", count);

    return 0;
}
