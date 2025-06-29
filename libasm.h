// libasm.h
#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>

void    ft_hello(void);
ssize_t ft_read(int, void *buf, size_t count);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strdup(const char *s);
char    *ft_strcpy(char *dest, const char *src);
size_t  ft_strlen(const void *string);
ssize_t ft_write(int fd, const void *buffer, size_t n);

#endif