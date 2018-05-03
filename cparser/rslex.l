%{
  #include <stdbool.h>

  #include "rslex.h"
  #include "y.tab.h"
%}

%option reentrant stack bison-bridge noyywrap

%x SECT_RULES
%x COMMENT

WHITESPACE [[:blank:]]+
OPTWHITESPACE [[:blank:]]*

NEWLINE \r?\n
NAME ([[:alpha:]_][[:alnum:]_]*)

%%

<INITIAL>{
  /*}*/
  
  ^"/*" yy_push_state(COMMENT, yyscanner);

  ^"%%" {
    sectnum = 2;
  }
}

<<EOF>> yyterminate();

%%
