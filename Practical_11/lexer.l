%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

static char *copy_text(const char *text) {
    size_t length = strlen(text) + 1;
    char *copy = malloc(length);

    if (copy == NULL) {
        perror("malloc");
        exit(EXIT_FAILURE);
    }

    memcpy(copy, text, length);
    return copy;
}
%}

%%

[0-9]+                  { yylval.str = copy_text(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.str = copy_text(yytext); return ID; }
[ \t\r]+                ;
\n                      { return '\n'; }
.                       { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}
