%{
#include <stdio.h>
#include <string.h>
%}

%token IDENTIFIER

%%

program: identifier
       | /* empty */
       ;

identifier: LETTER (LETTER | DIGIT)* {
    if (is_valid_variable($1)) {
        printf("Valid variable: %s\n", $1);
    } else {
        printf("Invalid variable: %s\n", $1);
    }
};

%%

int is_valid_variable(char* var) {
    // Check if the variable starts with a letter and contains only letters and digits.
    if (isalpha(var[0])) {
        for (int i = 1; i < strlen(var); i++) {
            if (!isalnum(var[i])) {
                return 0; // Invalid variable
            }
        }
        return 1; // Valid variable
    }
    return 0; // Invalid variable
}

int yylex() {
    int token = getchar();
    if (isalpha(token)) {
        yylval = token;
        return IDENTIFIER;
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
