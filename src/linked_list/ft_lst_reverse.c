#include "../../header/libft.h"

// Given the head of a list, reverse the list and return the
// head of reversed list
t_list* ft_lst_reverse(t_list* head)
{

    // Initialize three pointers: curr, prev and next
    t_list *curr = head, *prev = NULL, *next;

    // Traverse all the nodes of Linked List
    while (curr != NULL) {

        // Store next
        next = curr->next;

        // Reverse current node's next pointer
        curr->next = prev;

        // Move pointers one position ahead
        prev = curr;
        curr = next;
    }

    // Return the head of reversed linked list
    return prev;
}
