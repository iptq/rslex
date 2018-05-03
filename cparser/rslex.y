%define api.pure full
%lex-param {void *scanner}
%parse-param {void *scanner}{lexer_t *rslex}

%define parse.trace
%define parse.error verbose

%{
#include <stdio.h>
#include "rslex.h"
#include "y.tab.h"

void yyerror (yyscan_t *locp, lexer_t *rslex, char const *msg);
%}

%%

main:
;

%%

void yyerror(yyscan_t *locp, lexer_t *rslex, char const *msg) {
  fprintf(stderr, "--> %s\n", msg);
}
