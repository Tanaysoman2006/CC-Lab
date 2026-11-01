%{
#include "y.tab.h"
%}

%%

"int"|"float"|"char"  { return TYPE; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[0-9]+                { return NUM; }
[ \t\r\n]+            ;
.                     { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}
