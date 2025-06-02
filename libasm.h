// libasm.h
#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>

void    ft_hello(void);
size_t  ft_strlen(const void *string);
ssize_t ft_write(int fd, const void *buffer, size_t n);

#endif