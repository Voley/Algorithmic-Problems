#include <iostream>

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

ListNode* deleteDuplicates(ListNode* head) {
    ListNode *current = head;
    while (current && current->next) {
        if (current->val == current->next->val) {
            current->next = current->next->next;
        } else {
            current = current->next;
        }
    }
    return head;
}

int main() {
    return 0;
}
