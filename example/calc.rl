%{
    // calc implementated with rust lexer
    // ported from http://matt.might.net/articles/standalone-lexers-with-lex/
%}

ID [A-Za-z_][A-Za-z_0-9]*
INT -?[1-9][0-9]*
OP [-+*/^=]

%%

/* Print delimiters. */
[(] { println!("(left-parenthesis {})", yylineno); }
[)] { println!("(right-parenthesis {})", yylineno); }
[;] { println!("(semicolon {})", yylineno); }

/* Print identifiers, integers, and operators. */
{INT} { println!("(int {} {})", yytext, yylineno); }
{ID} { println!("(id \"{}\" {})", yytext, yylineno); }
{OP} { println!("(op \"{}\" {})", yytext, yylineno); }

/* Ignore comments and whitespace. */
#[^\n]* { }
[ \t\r\n] { }

<<EOF>> { println!("(eof {})", yylineno); }

%%

fn main() {
    println!("SHIET");
}
