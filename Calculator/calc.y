%{
#include <stdio.h>
%}

%token NUMBER
%token OPERATOR

%%

statement: expression { printf("Result: %d\n", $1); }
         ;

expression: expression OPERATOR expression {
                switch ($2) {
                    case '+': $$ = $1 + $3; break;
                    case '-': $$ = $1 - $3; break;
                    case '*': $$ = $1 * $3; break;
                    case '/': $$ = $1 / $3; break;
                }
            }
          | '(' expression ')' { $$ = $2; }
          | NUMBER { $$ = $1; }
          ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char* s) {
    printf("Error: %s\n", s);
}
