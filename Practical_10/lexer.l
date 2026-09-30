%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

"for"                   { return FOR; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[0-9]+                  { return NUM; }
"=="|"!="|"<="|">="|"<"|">" { return RELOP; }
"++"                    { return INC; }
"--"                    { return DEC; }
"="                     { return ASSIGN; }
[ \t\n]                 { /* ignore whitespace and newlines */ }
.                       { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}
