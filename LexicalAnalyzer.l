%{
#include <stdio.h>
#include <stdlib.h>
%}

/* Definitions */
DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT})*
INT_LITERAL {DIGIT}+
STRING      \"([^\n\"]*\n*)*\"
WS          [ \t]

%%

{WS}        /* Skip whitespace */
{INT_LITERAL} {
    printf("Token: INTEGER_LITERAL\t\tValue: %s\n", yytext);
}

{STRING} {
    printf("Token: STRING_LITERAL\t\tValue: %s\n", yytext);
}

"if"        { printf("Token: IF\n"); }
"else"      { printf("Token: ELSE\n"); }
"while"     { printf("Token: WHILE\n"); }
"for"       { printf("Token: FOR\n"); }
"int"       { printf("Token: INT\n"); }
"string"    { printf("Token: STRING\n"); }
"return"    { printf("Token: RETURN\n"); }
"print"     { printf("Token: PRINT\n"); }
"{"         { printf("Token: LEFT_BRACE\n"); }
"}"         { printf("Token: RIGHT_BRACE\n"); }
"("         { printf("Token: LEFT_PAREN\n"); }
")"         { printf("Token: RIGHT_PAREN\n"); }
";"         { printf("Token: SEMICOLON\n"); }
","         { printf("Token: COMMA\n"); }

{ID} {
    printf("Token: IDENTIFIER\t\tValue: %s\n", yytext);
}

"=="        { printf("Token: EQUAL\n"); }
"!="        { printf("Token: NOT_EQUAL\n"); }
"<"         { printf("Token: LESS_THAN\n"); }
">"         { printf("Token: GREATER_THAN\n"); }
"<="        { printf("Token: LESS_THAN_OR_EQUAL\n"); }
">="        { printf("Token: GREATER_THAN_OR_EQUAL\n"); }
"+"         { printf("Token: PLUS\n"); }
"-"         { printf("Token: MINUS\n"); }
"*"         { printf("Token: MULTIPLY\n"); }
"/"         { printf("Token: DIVIDE\n"); }
"="         { printf("Token: ASSIGN\n"); }
"\""        { printf("Token: DOUBLE_QUOTE\n"); }
\n          { /* Ignore newlines */ }

. {
    fprintf(stderr, "Error: Unrecognized token: %s\n", yytext);
    exit(1);
}

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* input_file = fopen(argv[1], "r");
    if (!input_file) {
        fprintf(stderr, "Error: Unable to open input file.\n");
        return 1;
    }

    yyin = input_file;
    yylex();
    fclose(input_file);

    return 0;
}
