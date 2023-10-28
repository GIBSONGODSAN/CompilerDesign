%{
#include <stdio.h>
%}

DIGIT           [0-9]
INT_CONSTANT    {DIGIT}+
FLOAT_CONSTANT  {DIGIT}+"."{DIGIT}+ | {DIGIT}+"." | "."{DIGIT}+
CHAR_CONSTANT   '\''[^\n']+'\''
NEWLINE         \n

%%
{INT_CONSTANT} {
    printf("Integer Constant: %s\n", yytext);
}

{FLOAT_CONSTANT} {
    printf("Float Constant: %s\n", yytext);
}

{CHAR_CONSTANT} {
    printf("Character Constant: %s\n", yytext);
}

{NEWLINE} {
    // Ignore newlines
}

. {
    // Ignore other characters
}

%%

int main(int argc, char* argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}
