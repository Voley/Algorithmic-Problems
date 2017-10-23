/*
 Intersection:
 Given two (singly) linked lists, determine of the two lists intersect. Return the intersecting node. Note that the intersection is defined based on reference, not value. That is, if the kth node of the first linked list is the exact same node(by reference) as the jth node of the second linked list, then they are intersecting.
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
    
    // used for returning count and head at the same time
    class Result {
    public:
        Node *tail;
        int size;
        
        Result(Node *tail, int size) {
            this->tail = tail;
            this->size = size;
        };
    };
    
    Node *intersection(Node* other) {
        Result *first = lastHeadAndCount(this);
        Result *second = lastHeadAndCount(other);
        Node *last1 = first->tail;
        Node *last2 = second->tail;
        
        if (last1 != last2) {
            return nullptr;
        }
        
        int count1 = first->size;
        int count2 = second->size;
        
        Node *n1 = this;
        Node *n2 = other;
        
        if (count1 > count2) {
            n1 = n1->advanceBy(count1 - count2);
        } else if (count2 > count1) {
            n2 = n2->advanceBy(count2 - count1);
        }
        
        while (n1 != nullptr) {
            if (n1 == n2) {
                return n1;
            }
            n1 = n1->next;
            n2 = n2->next;
        }
        
        return nullptr;
    }
    
    // normally you return one thing, but this saves performance here
    Result *lastHeadAndCount(Node *node) {
        Node *temp = node;
        int count = 1;
        while (temp != nullptr) {
            temp = temp->next;
            count++;
        }
        return new Result(temp, count);
    }
    
    Node *advanceBy(int value) {
        Node *temp = this;
        int counter = value;
        while (temp != nullptr && counter > 0) {
            temp = temp->next;
            counter--;
        }
        return temp;
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
    
    Node n3 = Node(2);
    Node n4 = Node(4);
    Node n5 = Node(9);
    
    n0.next = &n1;
    n1.next = &n2;
    n2.next = &n4;
    n3.next = &n4;
    n4.next = &n5;
    
    n0.printList();
    n3.printList();
    
    std::cout << "Is there intersection between lists? " << std::endl;
    
    Node *inter = n0.intersection(&n3);
    if (inter) {
        std::cout << "There is intersection at node with value " << inter->value << std::endl;
    }
    
    return 0;
}
