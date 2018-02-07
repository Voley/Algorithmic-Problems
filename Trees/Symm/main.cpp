#include <iostream>
#include <vector>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

bool helper(TreeNode* left, TreeNode* right);

bool isSymmetric(TreeNode* root) {
    return helper(root, root);
}

bool helper(TreeNode* left, TreeNode* right) {
    if (!left && !right) {
        return true;
    } else if ((!left && right) || (!right && left)) {
        return false;
    }
    return left->val == right->val && helper(left->left, right->right) && helper(right->left, left->right);
}

int main() {
    return 0;
}
