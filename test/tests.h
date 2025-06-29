#ifndef FT_LIBASM_TESTS
# define FT_LIBASM_TESTS

# include "../libasm.h"

# include <errno.h>
# include <fcntl.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <unistd.h>

// Declare test group runners
void run_read_tests(void);
void run_strcmp_tests(void);
void run_strcpy_tests(void);
void run_strdup_tests(void);
void run_strlen_tests(void);
void run_write_tests(void);

// Helper
void highlight_log(const char *message);

#endif