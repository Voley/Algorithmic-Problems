/*
 Delete Middle Node:
 Implement an algorithm to delete a node in the middle
 (i.e. any node but the first and last node, not necessarily the exact middle)
 of a singly linked list, given only access to that node
 
 Example:
 Input: node c from a-b-c-d-e-f
 Result: nothing is returned, but the new linked list looks like a-b-d-e-f
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
    
    void removeMiddleNode() {
        if (!this->next) {
            return;
        }
        this->value = this->next->value;
        this->next = this->next->next;
    }
    
    void printList() {
        Node *node = this;
        std::cout << "List: ";
        while (node) {
            std::cout << node->value << " ";
            node = node->next;
        }
        std::cout << std::endl;
    }
};

int main() {
    
    Node n0 = Node(1);
    Node n1 = Node(2);
    Node n2 = Node(3);
    
    n0.next = &n1;
    n1.next = &n2;
    
    n0.printList();
    n1.removeMiddleNode();
    std::cout << "Deleting node 2" << std::endl;
    n0.printList();
    
    return 0;
}
