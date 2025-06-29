# include "tests.h"

void assert_equal_int(const char *label, int expected, int actual) {

    printf("%s Case: %s |", (expected == actual) ? "PASS ✅" : "FAIL ❌", label);
    printf(" expected: %d;", expected);
    printf(" actual: %d\n", actual);
}

void test_ft_strcmp(const char *a, const char *b) {
    char desc[256];
    snprintf(desc, sizeof(desc), "ft_strcmp(\"%s\", \"%s\")", a, b);
    int expected = strcmp(a, b);
    int actual = ft_strcmp(a, b);
    assert_equal_int(desc, expected, actual);
}

void run_strcmp_tests(void) {
    highlight_log("ft_strcmp");

    test_ft_strcmp("hello", "hello");
    test_ft_strcmp("hello", "hell");
    test_ft_strcmp("hell", "hello");
    test_ft_strcmp("hello", "helloo");
    test_ft_strcmp("a", "b");
    test_ft_strcmp("b", "a");
    test_ft_strcmp("", "");
    test_ft_strcmp("a", "");
    test_ft_strcmp("", "a");
    test_ft_strcmp("hello", "Hello");
}
