# include "tests.h"

void assert_read_result(const char *desc, ssize_t expected, ssize_t actual, const char *expected_buf, const char *actual_buf, size_t size) {
    int pass = (expected == actual) && (memcmp(expected_buf, actual_buf, size) == 0);
    printf("%s Case: %s | ", pass ? "PASS ✅" : "FAIL ❌", desc);
    printf("expected %zd; got %zd\n", expected, actual);
}

void test_read_from_file(void) {
    char file[] = "test_read_tmp.txt";
    const char *content = "Assembly is fun!\n";
    int len = strlen(content);

    // Write test content to file
    int fd = open(file, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    write(fd, content, len);
    close(fd);

    // Open for reading
    fd = open(file, O_RDONLY);
    if (fd < 0) {
        perror("open failed");
        return;
    }

    char expected[64] = {0};
    char actual[64] = {0};

    // Use real read
    lseek(fd, 0, SEEK_SET);
    ssize_t r1 = read(fd, expected, sizeof(expected));

    // Use ft_read
    lseek(fd, 0, SEEK_SET);
    ssize_t r2 = ft_read(fd, actual, sizeof(actual));

    assert_read_result("ft_read from file", r1, r2, expected, actual, len);
    close(fd);
    unlink(file); // cleanup
}

void test_read_stdin_prompt(void) {
    puts("TEST 🪶  Case: ft_read from stdin — type something and press enter:");

    char buf[128] = {0};
    ssize_t r = ft_read(0, buf, 127);
    buf[r > 0 ? r : 0] = '\0';

    printf(">> Read from stdin (%zd bytes): \"%s\"\n\n", r, buf);
}

void test_invalid_fd(void) {
    
    char buffer[16] = {0};
    errno = 0;
    
    ssize_t result = ft_read(-42, buffer, 10);
    int saved_errno = errno;
    int pass = result == -1 && saved_errno != 0;
    printf("%s Case: ft_read with invalid fd | ", pass ? "PASS ✅" : "FAIL ❌");
    printf("Return: %zd;", result);
    printf("errno: %d (%s)\n", saved_errno, strerror(saved_errno));
}

void test_read_zero_bytes(void) {
    char buffer[16] = "unchanged";
    ssize_t result = ft_read(0, buffer, 0);
    int pass = result == 0;
    printf("%s Case: ft_read with 0-byte request | ", pass ? "PASS ✅" : "FAIL ❌");
    printf("Return: %zd; ", result);
    printf("Buffer: \"%s\"\n", buffer);
}

void run_read_tests(void) {
    highlight_log("ft_read");

    test_read_from_file();
    test_read_zero_bytes();
    test_invalid_fd();
    test_read_stdin_prompt();  // interactive test
}
