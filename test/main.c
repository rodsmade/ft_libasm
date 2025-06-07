#include "../libasm.h"
#include <stdio.h>
#include <string.h>

int main(void) {
    ft_hello();

    char buffer[26] = "First attempt at writing";
    buffer[24] = '\n';
    buffer[25] = '\0';

    ft_write(2, buffer, 25);
    printf("Size of string: %lu bytes.\n", ft_strlen(buffer));

    return 0;
}
