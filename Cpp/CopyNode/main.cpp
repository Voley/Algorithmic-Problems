#include <iostream>
#include <map>

struct Node {
    int value;
    Node *ptr1;
    Node *ptr2;
    Node(int i): ptr1(nullptr), ptr2(nullptr) {
        value = i;
    }
};

Node *copy_recursive(Node *cur, std::map<Node *, Node*>& map) {
    if (!cur) {
        return nullptr;
    }
    auto iter = map.find(cur);
    if (iter != map.end()) {
        return iter->second;
    }
    Node *node = new Node(cur->value);
    map[cur] = node;
    node->ptr1 = copy_recursive(cur->ptr1, map);
    node->ptr2 = copy_recursive(cur->ptr2, map);
    return node;
}

int main() {
    std::map<Node *, Node *> nodeMap;
    Node *first = new Node(1);
    Node *second = new Node(2);
    first->ptr1 = second;
    Node *copy = copy_recursive(first, nodeMap);
    
    std::cout << "Original : " << &first << " Child: " << &second << std::endl;
    std::cout << "Copy : " << &copy << " Child: " << &copy->ptr1 << std::endl;
    
    return 0;
}
