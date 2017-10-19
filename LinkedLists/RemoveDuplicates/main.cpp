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
    
    // Hash table solution
    
    void removeDuplicates() {
        std::set<int> map;
        Node* node = this;
        Node* prev = this;
        while (node) {
            if (map.count(node->value)) {
                prev->next = node->next;
            } else {
                map.insert(node->value);
                prev = node;
            }
            node = node->next;
        }
    }
    
    // Three pointers solution
    
    void removeDuplicatesQuadratic() {
        Node *current = this;
        Node *sentinel = current->next;
        Node *prev = this;
        
        while (current) {
            while (sentinel) {
                if (current->value == sentinel->value) {
                    prev->next = sentinel->next;
                } else {
                    prev = sentinel;
                }
                sentinel = sentinel-> next;
            }
            current = current->next;
            if (current) {
                sentinel = current->next;
            }
        }
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
    Node n3 = Node(1);
    Node n4 = Node(2);
    Node n5 = Node(4);
    
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    n4.next = &n5;
    
    n0.printList();
    n0.removeDuplicatesQuadratic();
    n0.printList();
    
    return 0;
}

