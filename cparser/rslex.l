%{

%}

%option stack noyywrap
%option prefix="rslex_"

%x SECT_RULES

WHITESPACE [[:blank:]]+
OPTWHITESPACE [[:blank:]]*

NEWLINE \r?\n
NAME ([[:alpha:]_][[:alnum:]_]*)

%%

<INITIAL>{
  
}

%%
