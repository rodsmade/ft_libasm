# include "tests.h"

int main(void) {
    puts("🚀 Starting tests for libasm...\n");

    ft_hello();

    run_strcmp_tests();
    run_strcpy_tests();
    run_strdup_tests();
    run_strlen_tests();
    run_write_tests();
    run_read_tests();
    
    return 0;
}
