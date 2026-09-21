%{
#include <stdio.h>

int count = 0;
%}

%%

([0-9]+(\.[0-9]*)?|[0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?    { count++; }

[ \t\n]+    { }

.           { }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the input (Press Ctrl+D to stop):\n");
    yylex();

    printf("\nValid numbers = %d\n", count);

    return 0;
}
