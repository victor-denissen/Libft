#include "../../header/libft.h"

void **ft_list_to_array(t_list *head, int *out_len) {
    int count = 0;
    t_list *cur = head;

    // First pass: count nodes
    while (cur) {
        count++;
        cur = cur->next;
    }

    void **array = malloc(sizeof(void *) * count);
    if (!array) return NULL;

    // Second pass: fill array
    cur = head;
    for (int i = 0; i < count; i++) {
        array[i] = cur->content;
        cur = cur->next;
    }

    if (out_len) *out_len = count;
    return array;
}
