#include <iostream>
#include <cmath>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

int helper(TreeNode *root, int value);

int longestUnivaluePath(TreeNode* root) {
    if (!root) {
        return 0;
    }
    int sub = std::max(longestUnivaluePath(root->left), longestUnivaluePath(root->right));
    return std::max(sub, helper(root->left, root->val) + helper(root->right, root->val));
}

int helper(TreeNode *root, int value) {
    if (!root || root->val != value) {
        return 0;
    }
    return 1 + std::max(helper(root->left, value), helper(root->right, value));
}

int main() {
    return 0;
}
