#include <iostream>
#include <vector>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

int sumHelper(TreeNode *root, bool shouldAdd);

int sumOfLeftLeaves(TreeNode* root) {
    return sumHelper(root, false);
}

int sumHelper(TreeNode *root, bool shouldAdd) {
    if (!root) {
        return 0;
    }
    if (shouldAdd && !root->left && !root->right) {
        return root->val;
    }
    return sumHelper(root->left, true) + sumHelper(root->right, false);
}

int main() {
    return 0;
}
