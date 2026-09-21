%{
#include <stdio.h>
%}

%%

.*COM\n    { printf("Matched (Ends with COM): %s", yytext); }
.*\n       { printf("Not Matched: %s", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter string/lines to test:\n");
    yylex();
    return 0;
}
