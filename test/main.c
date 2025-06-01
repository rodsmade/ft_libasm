#include "../libasm.h"

int main(void) {
    ft_hello();

    char buffer[25] = "First attempt at writing\n";
    ft_write(2, buffer, 20);

    return 0;
}
