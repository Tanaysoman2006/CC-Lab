%{
#include <stdio.h>
#include <stdlib.h>

int stack[100];
int top = -1;

void push(int value)
{
    stack[++top] = value;
}

int pop()
{
    return stack[top--];
}

%}

%%

[0-9]+ {
    push(atoi(yytext));
}

"+" {
    int b = pop();
    int a = pop();
    push(a + b);
}

"-" {
    int b = pop();
    int a = pop();
    push(a - b);
}

"*" {
    int b = pop();
    int a = pop();
    push(a * b);
}

"/" {
    int b = pop();
    int a = pop();
    push(a / b);
}

[ \t\n]+ ;

. {
    printf("Invalid character: %s\n", yytext);
}

%%

int main()
{
    printf("Enter postfix expression: ");
    yylex();

    if (top == 0)
        printf("Result = %d\n", stack[top]);
    else
        printf("Invalid postfix expression\n");

    return 0;
}

int yywrap()
{
    return 1;
}
