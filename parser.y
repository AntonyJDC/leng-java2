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
%token L_BRACE R_BRACE SEMICOLON L_PAREN R_PAREN L_BRACKET R_BRACKET
%token INTEGER_CONST DOUBLE_CONST STRING_LITERAL IDENTIFIER
%token EQ_OP LE_OP GE_OP NE_OP GT_OP LT_OP OP_AND OP_OR NOT_OP

%%
program:
      program statement
    | statement
    ;

compound_statement:
      L_BRACE statements R_BRACE
    ;

statements:
      statement
    | statements statement
    ;

statement:
      declaration_statement
    | expression_statement
    | compound_statement
    ;

declaration_statement:
      type_specifier IDENTIFIER SEMICOLON
    | type_specifier IDENTIFIER OP_ASIGN expression SEMICOLON
    ;

type_specifier:
      INT
    | DOUBLE
    | STRING
    | CHAR
    ;

expression_statement:
      expression SEMICOLON
    ;

expression:
      IDENTIFIER OP_ASIGN expression
    | conditional_expression
    ;

conditional_expression:
      logical_or_expression
    | logical_or_expression '?' expression ':' conditional_expression
    ;

logical_or_expression:
      logical_and_expression
    | logical_or_expression OP_OR logical_and_expression
    ;

logical_and_expression:
      equality_expression
    | logical_and_expression OP_AND equality_expression
    ;

equality_expression:
      relational_expression
    | equality_expression EQ_OP relational_expression
    | equality_expression NE_OP relational_expression
    ;

relational_expression:
      additive_expression
    | relational_expression GT_OP additive_expression
    | relational_expression LT_OP additive_expression
    | relational_expression GE_OP additive_expression
    | relational_expression LE_OP additive_expression
    ;

additive_expression:
      multiplicative_expression
    | additive_expression OP_SUM multiplicative_expression
    | additive_expression OP_SUST multiplicative_expression
    ;

multiplicative_expression:
      primary_expression
    | multiplicative_expression OP_MULT primary_expression
    | multiplicative_expression OP_DIV primary_expression
    ;

primary_expression:
      IDENTIFIER
    | INTEGER_CONST
    | DOUBLE_CONST
    | STRING_LITERAL
    | L_PAREN expression R_PAREN
    ;

%%
int main(void) {
    if (yyparse() == 0) {
        printf("Prueba con el archivo de entrada\nBien.\n");
    }
    return 0;
}
