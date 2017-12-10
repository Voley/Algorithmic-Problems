/*
 Loop Detection:
 Given a circular linked list, implement an algorithm that returns the node at the beginning of the loop.
 DEFINITION
 Circular linked list: A (corrupt) linked list in which a node's next pointer points to an earlier node, so as to make a loop in the linked list.
 EXAMPLE
 Input: a-b-c-d-e-c
 Output: c
 */

#include <iostream>
#include <string>

class Node {
public:
    int value;
    Node* next;
    Node(int n) {
        value = n;
        next = NULL;
    };
    
    void printList() {
        Node *node = this;
        std::cout << "List: ";
        while (node) {
            std::cout << node->value << " ";
            node = node->next;
        }
        std::cout << std::endl;
    }
    
    Node *detectLoop() {
        Node *slow = this;
        Node *fast = this;
        
        while (slow->next != nullptr && fast->next != nullptr) {
            slow = slow->next;
            fast = fast->next->next;
            if (slow == fast) {
                break;
            }
        }
        
        if (slow == fast) {
            slow = this;
            
            while (slow != fast) {
                slow = slow->next;
                fast = fast->next;
            }
            return slow;
        }
        return nullptr;
    }
};

int main() {
    
    Node n0 = Node(1);
    Node n1 = Node(2);
    
    n0.next = &n1;
    n1.next = &n0;
    
    std::cout << "Does list contain loop?" << std::endl;
    Node *loopStart = n0.detectLoop();
    if (loopStart) {
        std::cout << "Loop exists at node with value: " << loopStart->value << std::endl;
    }
    
    return 0;
}
