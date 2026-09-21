%{
#include <stdio.h>

int words = 0;
int numbers = 0;
%}

/* Pattern definitions */
DIGIT       [0-9]
EXPONENT    [eE][+-]?[0-9]+
NUM         (([0-9]+(\.[0-9]*)?)|(\.[0-9]+))({EXPONENT})?

%%

[Aa][A-Za-z]*      { words++; }

{NUM}              { numbers++; }

[ \t\n]+           { /* Ignore whitespace */ }

.                  { /* Ignore other characters */ }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the input (Press Ctrl+D to stop):\n");

    yylex();

    printf("\nWords starting with A/a = %d\n", words);
    printf("Valid numbers = %d\n", numbers);

    return 0;
}
