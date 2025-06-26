#include <stdio.h>
#include "../libasm.h"

// Declare test group runners
void run_strcmp_tests(void);
void run_strcpy_tests(void);
void run_strlen_tests(void);
void run_write_tests(void);

int main(void) {
    puts("🚀 Starting tests for libasm...\n");

    ft_hello();

    run_strcmp_tests();
    run_strcpy_tests();
    run_strlen_tests();
    run_write_tests();

    return 0;
}
