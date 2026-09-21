%{
#include <stdio.h>
#include <stdlib.h>
%}
%%
[0-9]+ {
    int num = atoi(yytext);
    printf("0x%x", num);
}
\n {
    printf("\n");
}
. {
    printf("%s", yytext);
}
%%
int yywrap()
{
    return 1;
}
int main(int argc, char **argv)
{
    if (argc > 1)
    {
        FILE *fp = fopen(argv[1], "r");

        if (fp)
            yyin = fp;
        else
        {
            printf("Error opening file %s\n", argv[1]);
            return 1;
        }
    }
    else
    {
        printf("Please provide an input file.\n");
        return 1;
    }
    yylex();
    return 0;
}
