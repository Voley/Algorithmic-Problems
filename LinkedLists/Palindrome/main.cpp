/*
 Palindrome:
 Implement a function to check if a linked list is a palindrome
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
    
    bool isPalindrome() {
        
        Node *temp = this;
        int count = temp->count();
        int midpoint = count / 2;
        int offset = count % 2;
        
        Node *secondHalf = temp;
        // first find middle node
        
        for (int i = 0; i < midpoint + offset; i++) {
            secondHalf = secondHalf->next;
        }
        
        secondHalf = secondHalf->reversedCopy();
        temp = this;
        for(int i = 0; i < midpoint; i++) {
            if (temp->value != secondHalf->value) {
                return false;
            }
            temp = temp->next;
            secondHalf = secondHalf->next;
        }
        return true;
    }
    
    Node* reversedCopy() {
        Node *newHead = NULL;
        Node *temp = this;
        
        while (temp) {
            Node *t = new Node(temp->value);
            if (newHead) {
                t->next = newHead;
                newHead = t;
            } else {
                newHead = t;
            }
            temp = temp->next;
        }
        return newHead;
    }
    
    int count() {
        int result = 0;
        Node *temp = this;
        
        while (temp) {
            result++;
            temp = temp->next;
        }
        
        return result;
    }
    
};

int main() {
    
    Node n0 = Node(1);
    Node n1 = Node(2);
    Node n2 = Node(3);
    Node n3 = Node(3);
    Node n4 = Node(2);
    Node n5 = Node(1);
    
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n3;
    n3.next = &n4;
    n4.next = &n5;
    
    n0.printList();
    
    std::cout << n0.isPalindrome() << std::endl;
    
    return 0;
}
