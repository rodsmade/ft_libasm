#include "tests.h"

void highlight_log(const char *func) {
    printf("\n\033[1;107;36m    Running tests for: %s ...                                                   \033[0m\n\n", func);
}
