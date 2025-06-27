#include "../libasm.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// ─────────────────────────────────────────────────────────────
// Helper
// ─────────────────────────────────────────────────────────────

void assert_strdup(const char *input) {
    char *expected = strdup(input);
    char *actual = ft_strdup(input);

    printf("ft_strdup(\"%s\"):\n", input);
    if (!expected || !actual) {
        printf("  strdup:    %p\n", (void *)expected);
        printf("  ft_strdup: %p\n", (void *)actual);
        printf("  ❌ One of the results is NULL.\n\n");
    } else if (strcmp(expected, actual) != 0) {
        printf("  strdup:    \"%s\"\n", expected);
        printf("  ft_strdup: \"%s\"\n", actual);
        printf("  ❌ Strings differ.\n\n");
    } else {
        printf("  ✅ PASS\n\n");
    }

    free(expected);
    free(actual); // memory returned by mmap can be freed if munmap'd, but here we skip it
}

// ─────────────────────────────────────────────────────────────
// Test Runner
// ─────────────────────────────────────────────────────────────

void run_strdup_tests(void) {
    puts("🧬 Running ft_strdup tests...\n");

    assert_strdup("");
    assert_strdup("42");
    assert_strdup("Assembly is FUN 🧠");
    assert_strdup("This is a longer test string to check buffer correctness.");
    assert_strdup("Lorem ipsum dolor sit amet, consectetur adipiscing elit.");
    assert_strdup("A\nB\nC\nD\nE");
    assert_strdup("🚀🌌✨🌕🌍"); // UTF-8 emoji sequence (should copy byte by byte anyway)
}
