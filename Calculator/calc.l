%{
#include "y.tab.h"
%}

%%

[ \t\n]         ; // Skip whitespace
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
"("             { return '('; }
")"             { return ')'; }
"="             { return '='; }
[-+*/]          { yylval = yytext[0]; return OPERATOR; }
.               { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
