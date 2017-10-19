/*
 Return Kth to Last:
     Implement an algorithm to find the kth to last element of a singly linked list
*/

#include <iostream>
#include <string>
#include <set>

class Node {
public:
    int value;
    Node* next;
    Node(int n) {
        value = n;
        next = NULL;
    };
    
    Node* elementFromEnd(int index) {
        
        Node *p1 = this;
        Node *p2 = this;
        
        for (int i = 0; i < index; i++) {
            p2 = p2->next;
        }
        
        while (p2 != NULL) {
            p1 = p1 -> next;
            p2 = p2 -> next;
        }
        return p1;
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
    Node n3 = Node(4);
    Node n4 = Node(5);
    Node n5 = Node(6);
    
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    n4.next = &n5;
    
    n0.printList();
    std::cout << "Element at index 3 from end: " << n0.elementFromEnd(3)->value << std::endl;
    
    return 0;
}
