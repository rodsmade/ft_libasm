#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

#include "../libasm.h"

void assert_equal_ssize_t(const char *label, ssize_t expected, ssize_t actual) {
    printf("%s\n", label);
    printf("  expected: %zd\n", expected);
    printf("  actual:   %zd\n", actual);
    printf("  ✅ %s\n\n", (expected == actual) ? "PASS" : "FAIL ❌");
}

void test_ft_write(const char *desc, int fd, const char *buf, size_t n) {
    errno = 0;
    ssize_t expected = write(fd, buf, n);
    int expected_errno = errno;

    errno = 0;
    ssize_t actual = ft_write(fd, buf, n);
    int actual_errno = errno;

    printf("Test: %s\n", desc);
    assert_equal_ssize_t("  Return value", expected, actual);
    printf("  expected errno: %d\n", expected_errno);
    printf("  actual errno:   %d\n", actual_errno);
    printf("  ✅ %s\n\n", (expected == actual && expected_errno == actual_errno) ? "PASS" : "FAIL ❌");
}

void run_write_tests(void) {
    puts("✍️  Running ft_write tests...\n");

    test_ft_write("Write to stdout", 1, "Hello from ft_write!\n", 21);
    test_ft_write("Write to stderr", 2, "Error message\n", 14);
    test_ft_write("Write empty string", 1, "", 0);
    test_ft_write("Write partial string", 1, "Hello world", 5);

    char big_buf[1024];
    memset(big_buf, 'A', sizeof(big_buf));
    test_ft_write("Write large buffer", 1, big_buf, sizeof(big_buf));

    test_ft_write("Invalid file descriptor (negative)", -1, "Oops", 4);
    test_ft_write("Invalid file descriptor (huge)", 9999, "Oops", 4);

    // Optional: test writing a string with a null byte
    char hidden_null[] = {'H', 'e', 'l', 'l', 'o', '\0', 'x', 'x'};
    test_ft_write("Write buffer with embedded null", 1, hidden_null, 8);
}
