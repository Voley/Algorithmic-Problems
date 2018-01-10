#include <iostream>
#include <vector>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

int depthHelper(int depth, TreeNode * root);

int minDepth(TreeNode* root) {
    return depthHelper(1, root);
}

int depthHelper(int depth, TreeNode * root) {
    if (!root) {
        return 0;
    } else if (root->left && root->right) {
        return std::min(depthHelper(depth, root->left), depthHelper(depth, root->right)) + 1;
    } else {
        return std::max(depthHelper(depth, root->left), depthHelper(depth, root->right)) + 1;
    }
}

int main() {
    return 0;
}
