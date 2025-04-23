#include "../../header/libft.h"

int ft_string_is_num(char *str)
{
    if (!str)
        return 0;
    for (size_t i = 0; i < ft_strlen(str); ++i)
        if (!ft_isdigit(str[i]))
            return 0;

    return 1;
}
