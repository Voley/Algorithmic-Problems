/*
 Partition:
 Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. If x is contained within the list, the values of x only need to be after the elements less than x (see below). The partition element x can appear anywhere in the “right partition”; it does not need to appear between the left and right partitions.
 
 Example
 Input: 3-5-8-5-10-2-1 [partition = 5]
 Output: 3-1-2-10-5-5-8
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
    
    Node* partition(int around, Node* node) {
        Node* head = node;
        Node* tail = node;
        Node* temp = node;
        
        while (temp != NULL) {
            Node *next = temp->next;
            if (temp->value < around) {
                temp->next = head;
                head = temp;
            } else {
                tail->next = temp;
                tail = temp;
            }
            temp = next;
        }
        
        tail->next = NULL;
        return head;
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
    
    Node n0 = Node(6);
    Node n1 = Node(5);
    Node n2 = Node(4);
    Node n3 = Node(3);
    Node n4 = Node(2);
    Node n5 = Node(1);
    
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    n4.next = &n5;
    
    n0.printList();
    Node *result = n0.partition(3, &n0);
    result->printList();
    
    return 0;
}
