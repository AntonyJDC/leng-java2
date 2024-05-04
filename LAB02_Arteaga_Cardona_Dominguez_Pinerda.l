%{
#include "LAB02_Arteaga_Cardona_Dominguez_Pinerda.tab.h"
extern int yylineno;
void start_comment();
%}

%option noyywrap
%x COMMENT

%%

[ \t]+                  ;
\n                      { yylineno++; }

"if"                    { return IF; }
"else"                  { return ELSE; }
"for"                   { return FOR; }
"while"                 { return WHILE; }
"double"                { return DOUBLE; }
"int"                   { return INT; }
"String"                { return STRING; }
"char"                  { return CHAR; }
"new"                   { return NEW; }
"public"                { return PUBLIC; }
"class"                 { return CLASS; }
"static"                { return STATIC; }
"void"                  { return VOID; }

"+"                     { return OP_SUM; }
"-"                     { return OP_SUST; }
"*"                     { return OP_MULT; }
"/"                     { return OP_DIV; }
"="                     { return OP_ASIGN; }
"%"                     { return OP_MOD; }
"++"                    { return INC_OP; }
"--"                    { return DEC_OP; }
"+="                    { return ADD_ASSIGN; }
"-="                    { return SUB_ASSIGN; }
"*="                    { return MUL_ASSIGN; }
"/="                    { return DIV_ASSIGN; }

"{"                     { return L_BRACE; }
"}"                     { return R_BRACE; }
";"                     { return SEMICOLON; }
","                     { return COMMA; }
"("                     { return L_PAREN; }
")"                     { return R_PAREN; }
"["                     { return L_BRACKET; }
"]"                     { return R_BRACKET; }

[0-9]+                  { return INTEGER_CONST; }
[0-9]+"."[0-9]*([eE][-+]?[0-9]+)?         { return DOUBLE_CONST; }
\"[^"\n]*\"             { return STRING_LITERAL; }

[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }

"=="                    { return EQ_OP; }
"<="                    { return LE_OP; }
">="                    { return GE_OP; }
"!="                    { return NE_OP; }
"<>"                    { return NE_OP; }
">"                     { return GT_OP; }
"<"                     { return LT_OP; }

"&&"                    { return OP_AND; }
"||"                    { return OP_OR; }
"!"                     { return NOT_OP; }


"//"[^\n]*              ;  // Ignora los comentarios de una sola línea

"/*"                    { start_comment(); }

.                       ;
%%

void start_comment() {
    int c;

    while ((c = input()) != 0) {
        if (c == '*') {
            if ((c = input()) == '/') {
                break;  // Termina el comentario si encuentra */
            }
            unput(c);  // Vuelve a poner el carácter si no es /
        }
    }
}