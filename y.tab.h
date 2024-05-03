/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IF = 258,                      /* IF  */
    ELSE = 259,                    /* ELSE  */
    FOR = 260,                     /* FOR  */
    WHILE = 261,                   /* WHILE  */
    DOUBLE = 262,                  /* DOUBLE  */
    INT = 263,                     /* INT  */
    STRING = 264,                  /* STRING  */
    CHAR = 265,                    /* CHAR  */
    NEW = 266,                     /* NEW  */
    PUBLIC = 267,                  /* PUBLIC  */
    CLASS = 268,                   /* CLASS  */
    STATIC = 269,                  /* STATIC  */
    VOID = 270,                    /* VOID  */
    OP_SUM = 271,                  /* OP_SUM  */
    OP_SUST = 272,                 /* OP_SUST  */
    OP_MULT = 273,                 /* OP_MULT  */
    OP_DIV = 274,                  /* OP_DIV  */
    OP_ASIGN = 275,                /* OP_ASIGN  */
    OP_MOD = 276,                  /* OP_MOD  */
    INC_OP = 277,                  /* INC_OP  */
    DEC_OP = 278,                  /* DEC_OP  */
    ADD_ASSIGN = 279,              /* ADD_ASSIGN  */
    SUB_ASSIGN = 280,              /* SUB_ASSIGN  */
    MUL_ASSIGN = 281,              /* MUL_ASSIGN  */
    DIV_ASSIGN = 282,              /* DIV_ASSIGN  */
    L_BRACE = 283,                 /* L_BRACE  */
    R_BRACE = 284,                 /* R_BRACE  */
    SEMICOLON = 285,               /* SEMICOLON  */
    L_PAREN = 286,                 /* L_PAREN  */
    R_PAREN = 287,                 /* R_PAREN  */
    L_BRACKET = 288,               /* L_BRACKET  */
    R_BRACKET = 289,               /* R_BRACKET  */
    INTEGER_CONST = 290,           /* INTEGER_CONST  */
    DOUBLE_CONST = 291,            /* DOUBLE_CONST  */
    STRING_LITERAL = 292,          /* STRING_LITERAL  */
    IDENTIFIER = 293,              /* IDENTIFIER  */
    EQ_OP = 294,                   /* EQ_OP  */
    LE_OP = 295,                   /* LE_OP  */
    GE_OP = 296,                   /* GE_OP  */
    NE_OP = 297,                   /* NE_OP  */
    GT_OP = 298,                   /* GT_OP  */
    LT_OP = 299,                   /* LT_OP  */
    OP_AND = 300,                  /* OP_AND  */
    OP_OR = 301,                   /* OP_OR  */
    NOT_OP = 302                   /* NOT_OP  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define IF 258
#define ELSE 259
#define FOR 260
#define WHILE 261
#define DOUBLE 262
#define INT 263
#define STRING 264
#define CHAR 265
#define NEW 266
#define PUBLIC 267
#define CLASS 268
#define STATIC 269
#define VOID 270
#define OP_SUM 271
#define OP_SUST 272
#define OP_MULT 273
#define OP_DIV 274
#define OP_ASIGN 275
#define OP_MOD 276
#define INC_OP 277
#define DEC_OP 278
#define ADD_ASSIGN 279
#define SUB_ASSIGN 280
#define MUL_ASSIGN 281
#define DIV_ASSIGN 282
#define L_BRACE 283
#define R_BRACE 284
#define SEMICOLON 285
#define L_PAREN 286
#define R_PAREN 287
#define L_BRACKET 288
#define R_BRACKET 289
#define INTEGER_CONST 290
#define DOUBLE_CONST 291
#define STRING_LITERAL 292
#define IDENTIFIER 293
#define EQ_OP 294
#define LE_OP 295
#define GE_OP 296
#define NE_OP 297
#define GT_OP 298
#define LT_OP 299
#define OP_AND 300
#define OP_OR 301
#define NOT_OP 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
