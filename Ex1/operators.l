%{
#include <stdio.h>
%}

%%
"++"    { printf("Operator: Increment (++)\n"); }
"--"    { printf("Operator: Decrement (--)\n"); }
"=="    { printf("Operator: Equal (==)\n"); }
"!="    { printf("Operator: Not Equal (!=)\n"); }
"<="    { printf("Operator: Less than or Equal (<=)\n"); }
">="    { printf("Operator: Greater than or Equal (>=)\n"); }
"<"     { printf("Operator: Less than (<)\n"); }
">"     { printf("Operator: Greater than (>)\n"); }
"&&"    { printf("Operator: Logical AND (&&)\n"); }
"||"    { printf("Operator: Logical OR (||)\n"); }
"+"     { printf("Operator: Addition (+)\n"); }
"-"     { printf("Operator: Subtraction (-)\n"); }
"*"     { printf("Operator: Multiplication (*)\n"); }
"/"     { printf("Operator: Division (/)\n"); }
"%"     { printf("Operator: Modulus (%)\n"); }
"="     { printf("Operator: Assignment (=)\n"); }
"+="    { printf("Operator: Add and Assign (+=)\n"); }
"-="    { printf("Operator: Subtract and Assign (-=)\n"); }
"*="    { printf("Operator: Multiply and Assign (*=)\n"); }
"/="    { printf("Operator: Divide and Assign (/=)\n"); }
"%="    { printf("Operator: Modulus and Assign (%=)\n"); }
"!"     { printf("Operator: Logical NOT (!)\n"); }
"&"     { printf("Operator: Bitwise AND (&)\n"); }
"|"     { printf("Operator: Bitwise OR (|)\n"); }
"^"     { printf("Operator: Bitwise XOR (^)\n"); }
"~"     { printf("Operator: Bitwise NOT (~)\n"); }
"<<="   { printf("Operator: Left Shift and Assign (<<=)\n"); }
">>="   { printf("Operator: Right Shift and Assign (>>=)\n"); }
"<<"    { printf("Operator: Left Shift (<<)\n"); }
">>"    { printf("Operator: Right Shift (>>)\n"); }
"&="    { printf("Operator: Bitwise AND and Assign (&=)\n"); }
"|="    { printf("Operator: Bitwise OR and Assign (|=)\n"); }
"^="    { printf("Operator: Bitwise XOR and Assign (^=)\n"); }
"sizeof" { printf("Operator: Sizeof (sizeof)\n"); }
"->"    { printf("Operator: Structure Pointer Access (->)\n"); }
"."     { printf("Operator: Member Access (.)\n"); }
"("     { printf("Operator: Left Parenthesis (()\n"); }
")"     { printf("Operator: Right Parenthesis ())\n"); }
"["     { printf("Operator: Left Square Bracket ([)\n"); }
"]"     { printf("Operator: Right Square Bracket (])\n"); }
"{"     { printf("Operator: Left Curly Brace ({)\n"); }
"}"     { printf("Operator: Right Curly Brace (})\n"); }
";"     { printf("Operator: Semicolon (;)\n"); }
","     { printf("Operator: Comma (,)\n"); }
":"     { printf("Operator: Colon (:)\n"); }
"?"     { printf("Operator: Question Mark (?)\n"); }
"..."   { printf("Operator: Ellipsis (...)\n"); }
"->*"   { printf("Operator: Structure Pointer Access and Dereference (->*)\n"); }
"<<="   { printf("Operator: Left Shift and Assign (<<=)\n"); }
">>="   { printf("Operator: Right Shift and Assign (>>=)\n"); }
"&="    { printf("Operator: Bitwise AND and Assign (&=)\n"); }
"|="    { printf("Operator: Bitwise OR and Assign (|=)\n"); }
"^="    { printf("Operator: Bitwise XOR and Assign (^=)\n"); }
"<<="   { printf("Operator: Left Shift and Assign (<<=)\n"); }
">>="   { printf("Operator: Right Shift and Assign (>>=)\n"); }
","     { printf("Operator: Comma (,)\n"); }
";"     { printf("Operator: Semicolon (;)\n"); }
":"     { printf("Operator: Colon (:)\n"); }
"?"     { printf("Operator: Question Mark (?)\n"); }

[ \t\n]    ;  // Ignore whitespace and tabs
.          { /* Ignore other characters */ }

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* input_file = fopen(argv[1], "r");
    if (!input_file) {
        printf("Error: Unable to open input file.\n");
        return 1;
    }

    yyin = input_file;
    yylex();
    fclose(input_file);

    return 0;
}
