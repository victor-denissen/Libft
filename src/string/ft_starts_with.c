#include "../../header/libft.h"

int ft_starts_with(const char *str, const char *prefix) {
    return ft_strncmp(str, prefix, ft_strlen(prefix)) == 0;
}
