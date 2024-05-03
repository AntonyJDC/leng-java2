%{
#include <stdio.h>
extern int yylineno;
extern int yylex(void);
int error_count = 0;

int yyerror(const char *s) {
    fprintf(stderr, "Error sintáctico en línea número: %d\n", yylineno);
    error_count++;
}
%}

%token IF ELSE FOR WHILE DOUBLE INT STRING CHAR NEW PUBLIC CLASS STATIC VOID
%token OP_SUM OP_SUST OP_MULT OP_DIV OP_ASIGN OP_MOD
%token INC_OP DEC_OP ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN
%token L_BRACE R_BRACE SEMICOLON L_PAREN R_PAREN L_BRACKET R_BRACKET COMMA
%token INTEGER_CONST DOUBLE_CONST STRING_LITERAL IDENTIFIER
%token EQ_OP LE_OP GE_OP NE_OP GT_OP LT_OP OP_AND OP_OR NOT_OP

%right OP_ASIGN ADD_ASSIGN SUB_ASSIGN MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN
%left OP_OR OP_AND
%left EQ_OP NE_OP LT_OP LE_OP GT_OP GE_OP
%left OP_SUM OP_SUST
%left OP_MULT OP_DIV OP_MOD
%right NOT_OP INC_OP DEC_OP
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%
program:
    class_definitions
    ;

class_definitions:
    class_definition
    | class_definitions class_definition
    ;

class_definition:
    PUBLIC CLASS IDENTIFIER L_BRACE method_definitions R_BRACE
    ;

method_definitions:
    | nonempty_method_definitions
    ;

nonempty_method_definitions:
    method_definition
    | nonempty_method_definitions method_definition
    ;

method_definition:
    method_header compound_statement
    ;

method_header:
    PUBLIC STATIC type IDENTIFIER L_PAREN parameters R_PAREN
    ;

parameters:
    | STRING L_BRACKET R_BRACKET IDENTIFIER
    ;

type:
    VOID
    | INT
    | DOUBLE
    | CHAR
    | STRING
    ;

compound_statement:
    L_BRACE statements R_BRACE
    ;

statements:
    | statements statement
    ;

statement:
    error SEMICOLON { yyerrok; }
    | expression_statement
    | declaration_statement
    | compound_statement
    | if_statement
    | while_statement
    | for_statement
    ;

expression_statement:
    expression SEMICOLON
    ;

declaration_statement:
    type IDENTIFIER SEMICOLON
    | type IDENTIFIER OP_ASIGN expression SEMICOLON
    | type IDENTIFIER COMMA IDENTIFIER SEMICOLON
    ;

expression:
    INTEGER_CONST
    | DOUBLE_CONST
    | STRING_LITERAL
    | IDENTIFIER
    | expression OP_SUM expression
    | expression OP_SUST expression
    | expression OP_MULT expression
    | expression OP_DIV expression
    | IDENTIFIER OP_ASIGN expression
    | expression OP_MOD expression
    | expression INC_OP
    | expression DEC_OP
    | expression ADD_ASSIGN expression
    | expression SUB_ASSIGN expression
    | expression MUL_ASSIGN expression
    | expression DIV_ASSIGN expression
    | expression EQ_OP expression
    | expression LE_OP expression
    | expression GE_OP expression
    | expression NE_OP expression
    | expression GT_OP expression
    | expression LT_OP expression
    | expression OP_AND expression
    | expression OP_OR expression
    | NOT_OP expression %prec NOT_OP
    | L_PAREN expression R_PAREN %prec L_PAREN
    ;

if_statement:
    IF L_PAREN expression R_PAREN statement %prec LOWER_THAN_ELSE
    | IF L_PAREN expression R_PAREN statement ELSE statement
    ;
    
while_statement:
    WHILE L_PAREN expression R_PAREN statement
    ;

for_statement:
    FOR L_PAREN for_init SEMICOLON expression SEMICOLON expression R_PAREN compound_statement
    ;

for_init:
    type IDENTIFIER OP_ASIGN expression
    | IDENTIFIER OP_ASIGN expression
    ;

%%

int main(void) {
    printf("Prueba con el archivo de entrada\n");
    if (yyparse() == 0 && error_count == 0) {
        printf("Bien.\n");
    }
    return 0;
}
