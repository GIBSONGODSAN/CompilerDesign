%{
#include <stdio.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

expression: expression '+' expression
          | expression '-' expression
          | expression '*' expression
          | expression '/' expression
          | '(' expression ')'
          | NUMBER
          ;

%%

int yylex() {
    int token = getchar();
    if (token >= '0' && token <= '9') {
        yylval = token - '0';
        return NUMBER;
    }
    return token;
}

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
}
