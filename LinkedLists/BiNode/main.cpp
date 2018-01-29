#include <iostream>

class BiNode {
public:
    BiNode *node1;
    BiNode *node2;
    int value;
    
    BiNode() {
        value = 0;
    }
    
    void concat(BiNode *x, BiNode *y) {
        x->node2 = y;
        y->node1 = x;
    }
    
    BiNode *convert(BiNode *root) {
        BiNode *head = convertToCircular(root);
        head->node1->node2 = nullptr;
        head->node1 = nullptr;
        return head;
    }
    
    BiNode *convertToCircular(BiNode *root) {
        if (!root) {
            return nullptr;
        }
        BiNode *p1 = convertToCircular(root->node1);
        BiNode *p3 = convertToCircular(root->node2);
        
        if (!p1 && !p3) {
            root->node1 = root;
            root->node2 = root;
            return root;
        }
        
        BiNode *tail3 = p3 == nullptr ? nullptr : p3->node1;
        
        if (!p1) {
            concat(p3->node1, root);
        } else {
            concat(p1->node1, root);
        }
        
        if (!p3) {
            concat(root, p1);
        } else {
            concat(root, p3);
        }
        
        if (p1 && p3) {
            concat(tail3, p1);
        }
        
        return p1 == nullptr ? root : p1;
    }
};

int main() {
    return 0;
}
