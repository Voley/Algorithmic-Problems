#include <iostream>
#include <vector>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

int maxDepth(TreeNode* root) {
    if (!root) {
        return 0;
    }
    return std::max(maxDepth(root->left), maxDepth(root->right)) + 1;
}

int main() {
    return 0;
}
