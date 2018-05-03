%{
  #include <stdbool.h>

  #include "rslex.h"
%}

%option stack noyywrap
%option prefix="rslex_"

%x SECT_RULES
%x COMMENT

WHITESPACE [[:blank:]]+
OPTWHITESPACE [[:blank:]]*

NEWLINE \r?\n
NAME ([[:alpha:]_][[:alnum:]_]*)

%%

<INITIAL>{
  /*}*/
  
  ^"/*" yy_push_state(COMMENT);

  ^"%%" {
    sectnum = 2;
  }
}

%%
