#include <stdio.h>
#include <string.h>
#include "../libasm.h"

void assert_equal_str(const char *label, const char *expected, const char *actual) {
    printf("%s\n", label);
    printf("  expected: \"%s\"\n", expected);
    printf("  actual:   \"%s\"\n", actual);
    printf("  ✅ %s\n\n", (strcmp(expected, actual) == 0) ? "PASS" : "FAIL ❌");
}

void assert_same_pointer(const char *label, const void *expected, const void *actual) {
    printf("%s\n", label);
    printf("  expected ptr: %p\n", expected);
    printf("  actual ptr:   %p\n", actual);
    printf("  ✅ %s\n\n", (expected == actual) ? "PASS" : "FAIL ❌");
}

void test_ft_strcpy(const char *src) {
    char buffer[1024] = {0}; // big enough to hold anything we throw at it

    char *ret = ft_strcpy(buffer, src);

    char desc[256];
    snprintf(desc, sizeof(desc), "ft_strcpy(\"%s\")", src);

    assert_equal_str(desc, src, buffer);
    assert_same_pointer("Returned pointer check", buffer, ret);
}

void run_strcpy_tests(void) {
    puts("📋 Running ft_strcpy tests...\n");

    test_ft_strcpy("");                        // empty string
    test_ft_strcpy("a");                       // single character
    test_ft_strcpy("hello");                   // normal string
    test_ft_strcpy("copy with spaces");        // spaces
    test_ft_strcpy("newlines\nincluded");      // newline inside
    test_ft_strcpy("tabs\tand more");          // tabs
    test_ft_strcpy("symbols!@#$%^&*()");       // symbols
    test_ft_strcpy("null\0hidden");            // hidden tail: only copies until null
    test_ft_strcpy("UTF8: 🚀💥🧠✨");        // multibyte UTF-8

    // Long string
    char long_src[512];
    memset(long_src, 'x', 511);
    long_src[511] = '\0';
    test_ft_strcpy(long_src);
}
