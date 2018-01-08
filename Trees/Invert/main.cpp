#include <iostream>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};
class Solution {
public:
    TreeNode* invertTree(TreeNode* root) {
        if (!root) {
            return nullptr;
        }
        auto left = invertTree(root->left);
        auto right = invertTree(root->right);
        root->right = left;
        root->left = right;
        return root;
    }
};

int main() {
    return 0;
}
