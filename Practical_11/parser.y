%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *message);

static int temp_number = 1;

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

static char *emit_operation(char *left, char operator, char *right) {
    char temp_name[32];
    snprintf(temp_name, sizeof(temp_name), "t%d", temp_number++);
    printf("%s = %s %c %s\n", temp_name, left, operator, right);
    free(left);
    free(right);
    return copy_text(temp_name);
}
%}

%union {
    char *str;
}

%token <str> ID NUM
%type <str> expr
%left '+' '-'
%left '*' '/'

%%

input:
    /* empty */
  | input line
  ;

line:
    ID '=' expr '\n' {
        printf("%s = %s\n", $1, $3);
        free($1);
        free($3);
        temp_number = 1;
    }
  | '\n' {
        temp_number = 1;
    }
  | error '\n' {
        yyerrok;
        temp_number = 1;
    }
  ;

expr:
    expr '+' expr { $$ = emit_operation($1, '+', $3); }
  | expr '-' expr { $$ = emit_operation($1, '-', $3); }
  | expr '*' expr { $$ = emit_operation($1, '*', $3); }
  | expr '/' expr { $$ = emit_operation($1, '/', $3); }
  | '(' expr ')'  { $$ = $2; }
  | ID            { $$ = $1; }
  | NUM           { $$ = $1; }
  ;

%%

void yyerror(const char *message) {
    fprintf(stderr, "Invalid assignment expression: %s\n", message);
}

int main(void) {
    printf("Enter an assignment expression (Ctrl+D to stop):\n");
    return yyparse();
}
