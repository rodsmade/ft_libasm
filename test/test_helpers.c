#include <stdio.h>

void assert_equal_int(const char *label, int expected, int actual) {
    printf("%s\n", label);
    printf("  expected: %d\n", expected);
    printf("  actual:   %d\n", actual);
    printf("  ✅ %s\n\n", (expected == actual) ? "PASS" : "FAIL ❌");
}
