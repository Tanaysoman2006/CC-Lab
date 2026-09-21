%{
#include <stdio.h>
#include <string.h>

int comment_count = 0;
int keyword_count = 0;
int identifier_count = 0;
int total_words = 0;
int total_lines = 0;
int total_spaces = 0;
%}

%%
"//".*                          { comment_count++; }
"/*"([^*]|(\*+[^*/]))*\*+"/"    { comment_count++; }

"int"|"float"|"char"|"double"|"void"|"if"|"else"|"while"|"for"|"return"|"break"|"continue" {
    keyword_count++;
    total_words++;
}

[a-zA-Z_][a-zA-Z0-9_]*          { identifier_count++; total_words++; }
" "                             { total_spaces += yyleng; }
\n                              { total_lines++; }
[\t]+                           ;
[^\t\n ]+                       { total_words++; }
%%

int main() {
    printf("Type/paste your C code below. Press Ctrl+D when finished:\n\n");

    yyin = stdin;

    yylex();

    printf("\n=== Lexical Summary ===\n");
    printf("Total Comments    : %d\n", comment_count);
    printf("Total Keywords    : %d\n", keyword_count);
    printf("Total Identifiers : %d\n", identifier_count);
    printf("Total Words       : %d\n", total_words);
    printf("Total Lines       : %d\n", total_lines);
    printf("Total Spaces      : %d\n", total_spaces);
    printf("=======================\n");

    return 0;
}

int yywrap() {
    return 1;
}
