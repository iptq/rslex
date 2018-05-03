#include <stdio.h>

#include "rslex.h"
#include "y.tab.h"

int sectnum;

int rslex_parse_main() {
    sectnum = 1;
    rslex_parse();
    return 2;
}
