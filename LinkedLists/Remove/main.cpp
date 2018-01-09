#include <iostream>
#include <unordered_map>

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

ListNode* removeElements(ListNode* head, int val) {
    ListNode *result = nullptr;
    while (head && head->val == val) {
        head = head->next;
    }
    result = head;
    if (!result) {
        return result;
    }
    ListNode *prev = head;
    ListNode *next = head->next;
    
    while (next) {
        if (next->val == val) {
            prev->next = next->next;
            next = next->next;
        } else {
            prev = next;
            next = next->next;
        }
    }
    return result;
}

int main() {
    return 0;
}
