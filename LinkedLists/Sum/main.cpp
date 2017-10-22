/*
 Sum Lists:
 You have two numbers represented by a linked list, where each node contains a single digit. The digits are stored in reverse order, such that the 1's digit is at the head of the list. Write a function that adds the two numbers and returns the sum as a linked list.
 
 Example:
 Input: 7-1-6 + 5-9-2, that is 617 + 295
 Output: 2-1-9, that is 912
 
 Follow up:
 Suppose the digits are stored in forward order. Repeat the above problem.
 Example:
 Input: 6-1-7 + 2-9-5, that is 617 + 295
 Output: 9-1-2, that is 912
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
    
    static Node* sumBackwardsList(Node* first, Node* second, int carry) {
        
        if (first == NULL && second == NULL && carry == 0) {
            return NULL;
        }
        
        Node* result = new Node(0);
        
        int firstValue = first != NULL? first->value : 0;
        int secondValue = second != NULL? second->value : 0;
        int value = firstValue + secondValue + carry;
        carry = value / 10;
        value = value % 10;
        
        result->value = value;
        
        if (first != NULL || second != NULL) {
            result->next = sumBackwardsList(first->next, second->next, carry);
        }
        return result;
    }
};

int main() {
    
    Node n0 = Node(1);
    Node n1 = Node(2);
    Node n2 = Node(3);
    
    Node n3 = Node(2);
    Node n4 = Node(3);
    Node n5 = Node(9);
    
    n0.next = &n1;
    n1.next = &n2;
    
    n3.next = &n4;
    n4.next = &n5;
    
    n0.printList();
    n3.printList();
    
    Node* result = Node::sumBackwardsList(&n0, &n3, 0);
    result->printList();
    
    return 0;
}
