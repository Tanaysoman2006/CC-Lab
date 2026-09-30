%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token FOR ID NUM RELOP ASSIGN INC DEC

%%

stmt:
    FOR '(' init ';' condition ';' update ')' body {
        printf("Valid FOR Loop Syntax!\n");
        exit(0);
    }
    ;

init:
    ID ASSIGN expr
  | /* empty */
  ;

condition:
    expr RELOP expr
  | expr
  | /* empty */
  ;

update:
    ID INC
  | INC ID
  | ID DEC
  | DEC ID
  | ID ASSIGN expr
  | /* empty */
  ;

body:
    '{' stmt_list '}'
  | stmt_single
  | ';'
  ;

stmt_list:
    stmt_single stmt_list
  | /* empty */
  ;

stmt_single:
    ID ASSIGN expr ';'
  | ID INC ';'
  | INC ID ';'
  | ID DEC ';'
  | DEC ID ';'
  | expr ';'
  ;

expr:
    ID
  | NUM
  ;

%%

void yyerror(const char *s) {
    printf("Invalid FOR Loop Syntax!\n");
    exit(1);
}

int main(void) {
    printf("Enter a FOR loop statement:\n");
    yyparse();
    return 0;
}
