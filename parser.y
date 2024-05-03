%{
#include <stdio.h>
extern int yylineno;
extern int yylex(void);
int yyerror(char *s) {
    fprintf(stderr, "Prueba con el archivo de entrada\nError sintáctico en línea número: %d\n", yylineno);
    return 0;
}
%}

%token IF ELSE FOR WHILE DOUBLE INT STRING CHAR NEW PUBLIC CLASS STATIC VOID
%token OP_SUM OP_SUST OP_MULT OP_DIV OP_ASIGN OP_MOD
%token INC_OP DEC_OP ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN
%token L_BRACE R_BRACE SEMICOLON L_PAREN R_PAREN L_BRACKET R_BRACKET COMMA
%token INTEGER_CONST DOUBLE_CONST STRING_LITERAL IDENTIFIER
%token EQ_OP LE_OP GE_OP NE_OP GT_OP LT_OP OP_AND OP_OR NOT_OP

%%
program:
    class_definition
    ;

class_definition:
    PUBLIC CLASS IDENTIFIER L_BRACE class_body R_BRACE
    ;

class_body:
    
    ;
%%

int main(void) {
    if (yyparse() == 0) {
        printf("Prueba con el archivo de entrada\nBien.\n");
    }
    return 0;
}
