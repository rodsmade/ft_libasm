#include <stdio.h>
#include <string.h>
#include "../libasm.h"

void assert_equal_size_t(const char *label, size_t expected, size_t actual) {
    printf("%s\n", label);
    printf("  expected: %lu\n", expected);
    printf("  actual:   %lu\n", actual);
    printf("  ✅ %s\n\n", (expected == actual) ? "PASS" : "FAIL ❌");
}

void test_ft_strlen(const char *input) {
    char desc[256];
    snprintf(desc, sizeof(desc), "ft_strlen(\"%s\")", input);

    size_t expected = strlen(input);
    size_t actual = ft_strlen(input);

    assert_equal_size_t(desc, expected, actual);
}

void run_strlen_tests(void) {
    puts("📏 Running ft_strlen tests...\n");

    test_ft_strlen("");                            // Empty string
    test_ft_strlen("a");                           // Single character
    test_ft_strlen("abc");                         // Small string
    test_ft_strlen("Hello, world!");               // Punctuation
    test_ft_strlen("      ");                      // All spaces
    test_ft_strlen("Newline\nin\nthe\nstring");    // Newlines
    test_ft_strlen("\tTabbed string\t");           // Tabs
    test_ft_strlen("Special chars: @#$%^&*()");    // Misc symbols
    test_ft_strlen("1234567890");                  // Digits
    test_ft_strlen("null\0hidden");                // Embedded null → strlen stops at `\0`

    // UTF-8 strings (each emoji is 2+ bytes, strlen should count bytes, not characters)
    test_ft_strlen("🧠");
    test_ft_strlen("🚀🔥✨💻");
    test_ft_strlen("UTF-8 ∆ test");

    // Very long string (200 'x' characters)
    char long_str[201];
    memset(long_str, 'x', 200);
    long_str[200] = '\0';
    test_ft_strlen(long_str);
}
