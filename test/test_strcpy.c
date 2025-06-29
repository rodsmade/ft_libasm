#include <stdio.h>
#include <string.h>
#include "../libasm.h"

void assert_equal_str(const char *label, const char *expected, const char *actual) {
    printf("%s Case: %s;", (strcmp(expected, actual) == 0) ? "PASS ✅" : "FAIL ❌", label);
    printf(" expected: \"%s\" |", expected);
    printf(" actual: \"%s\"\n", actual);
}

void assert_same_pointer(const void *expected, const void *actual) {
    printf("%s Returned pointer check;", (expected == actual) ? "PASS ✅" : "FAIL ❌");
    printf(" expected ptr: %p |", expected);
    printf(" actual ptr: %p\n", actual);
}

void test_ft_strcpy(const char *label, const char *src) {
    char dest[1024] = {0}; // big enough to hold anything we throw at it

    char *ret = ft_strcpy(dest, src);

    assert_equal_str(label, src, dest);
    assert_same_pointer(dest, ret);
}

void run_strcpy_tests(void) {
    puts("\n📋 Running ft_strcpy tests...\n");

    test_ft_strcpy("Empty string", "");
    test_ft_strcpy("Single character", "a");
    test_ft_strcpy("Normal string", "hello");
    test_ft_strcpy("Spaces", "copy with spaces");
    test_ft_strcpy("Newline inside", "newlines\nincluded");
    test_ft_strcpy("Tabs", "tabs\tand more");
    test_ft_strcpy("Symbols", "symbols!@#$%^&*()");
    test_ft_strcpy("Hidden tail: only copies until null", "null\0hidden");
    test_ft_strcpy("Multibyte UTF-8", "UTF8: 🚀💥🧠✨");

    // Long string
    char long_src[512];
    memset(long_src, 'x', 511);
    long_src[511] = '\0';
    test_ft_strcpy("Long string", long_src);
}
