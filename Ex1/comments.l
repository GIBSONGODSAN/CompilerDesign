%{
#include <stdio.h>
%}

%option noyywrap

%%
"//"(.*) {
    printf("Single-line Comment: %s\n", yytext);
}

"/*"([^*]|\*+[^*/])*"*/" {
    printf("Multi-line Comment: %s\n", yytext);
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
