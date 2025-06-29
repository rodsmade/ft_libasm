# include "tests.h"

// ─────────────────────────────────────────────────────────────
// Helper
// ─────────────────────────────────────────────────────────────

void assert_strdup(const char *input) {
    char *expected = strdup(input);
    char *actual = ft_strdup(input);

    if (!expected || !actual) {
        printf("  strdup:    %p\n", (void *)expected);
        printf("  ft_strdup: %p\n", (void *)actual);
        printf("  ❌ One of the results is NULL.\n");
    } else if (strcmp(expected, actual) != 0) {
        printf("  strdup:    \"%s\"\n", expected);
        printf("  ft_strdup: \"%s\"\n", actual);
        printf("  ❌ Strings differ.\n");
    } else {
        printf("PASS ✅ Case: ft_strdup(\"%s\")\n", input);
    }

    free(expected);
}

// ─────────────────────────────────────────────────────────────
// Test Runner
// ─────────────────────────────────────────────────────────────

void run_strdup_tests(void) {
    highlight_log("ft_strdup");

    assert_strdup("");
    assert_strdup("42");
    assert_strdup("Assembly is FUN 🧠");
    assert_strdup("This is a longer test string to check buffer correctness.");
    assert_strdup("Lorem ipsum dolor sit amet, consectetur adipiscing elit.");
    assert_strdup("A\nB\nC\nD\nE");
    assert_strdup("🚀🌌✨🌕🌍"); // UTF-8 emoji sequence (should copy byte by byte anyway)
}
