#include <iostream>
#include <vector>
#include <memory>

class RankNode {
    int data;
public:
    int left_size;
    std::unique_ptr<RankNode> left;
    std::unique_ptr<RankNode> right;
    
    RankNode(int d) {
        data = d;
        left_size = 0;
    }
    
    void insert(int d) {
        if (d <= data) {
            if (!left) {
                left = std::unique_ptr<RankNode>(new RankNode(d));
            } else {
                left->insert(d);
            }
            left_size++;
        } else {
            if (!right) {
                right = std::unique_ptr<RankNode>(new RankNode(d));
            } else {
                right->insert(d);
            }
        }
    }
    
    int getRank(int d) {
        if (d == data) {
            return left_size;
        } else if (d < data) {
            if (!left) {
                return -1;
            } else {
                return left->getRank(d);
            }
        } else {
            int rightRank = !right ? -1 : right ->getRank(d);
            if (rightRank == -1) {
                return -1;
            } else {
                return left_size + 1 + rightRank;
            }
        }
    }
};

void track(int number, RankNode *& root) {
    if (!root) {
        root = new RankNode(number);
    } else {
        root->insert(number);
    }
}

int getRank(int number, RankNode& root) {
    return root.getRank(number);
}

int main() {
    RankNode *root = nullptr;
    std::vector<int> vec {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    
    for (const auto& i: vec) {
        track(i, root);
    }
    std::cout << getRank(5, *root) << std::endl;
    
    return 0;
}
