#include <stdio.h>

#include "rslex.h"

int sectnum;

lexer_t rslex_parse_main(const char *src) {
    lexer_t result;
    yyscan_t scanner;
    struct yy_buffer_state *buf;

    sectnum = 1;

    yylex_init(&scanner);
    buf = yy_scan_string(src, scanner);
    yylex(&result, scanner);

    // yy_delete_buffer(buf, scanner);
    yylex_destroy(scanner);

    return result;
}
