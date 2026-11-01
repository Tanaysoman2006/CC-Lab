%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *message);
%}

%union {
    int count;
}

%token TYPE ID NUM
%type <count> dimensions

%%

declaration:
    TYPE ID dimensions ';' {
        printf("Valid array declaration\n");
        printf("Number of dimensions = %d\n", $3);
    }
  ;

dimensions:
    '[' NUM ']'                  { $$ = 1; }
  | dimensions '[' NUM ']'       { $$ = $1 + 1; }
  ;

%%

void yyerror(const char *message) {
    (void)message;
    fprintf(stderr, "Invalid array declaration\n");
}

int main(void) {
    printf("Enter array declaration:\n");
    return yyparse();
}
