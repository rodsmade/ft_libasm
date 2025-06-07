#include "../libasm.h"
#include <stdio.h>
#include <string.h>

void test_ft_strcmp(const char *a, const char *b) {
    int std = strcmp(a, b);
    int custom = ft_strcmp(a, b);
    printf("Comparing \"%s\" vs \"%s\"\n", a, b);
    printf("  strcmp:    %d\n", std);
    printf("  ft_strcmp: %d\n", custom);
    printf("  ✅ %s\n\n", (std == custom) ? "PASS" : "FAIL ❌");
}

int main(void) {
    ft_hello();

    char buffer[26] = "First attempt at writing";
    buffer[24] = '\n';
    buffer[25] = '\0';

    ft_write(2, buffer, 25);
    printf("Size of string: %lu bytes.\n", ft_strlen(buffer));

    test_ft_strcmp("hello", "hello");
    test_ft_strcmp("hello", "hell");
    test_ft_strcmp("hell", "hello");
    test_ft_strcmp("hello", "helloo");
    test_ft_strcmp("a", "b");
    test_ft_strcmp("b", "a");
    test_ft_strcmp("", "");
    test_ft_strcmp("a", "");
    test_ft_strcmp("", "a");
    test_ft_strcmp("hello", "Hello");  // ASCII diff

    return 0;
}
