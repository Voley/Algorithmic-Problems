#include <iostream>
#include <vector>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    int getMinimumDifference(TreeNode* root) {
        int result = INT_MAX;
        TreeNode *prev = nullptr;
        inOrderHelper(root, prev, &result);
        return result;
    }
    
    void inOrderHelper(TreeNode *root, TreeNode *&prev, int *diff) {
        if (!root) {
            return;
        }
        inOrderHelper(root->left, prev, diff);
        if (prev) {
            *diff = std::min(*diff, root->val - prev->val);
        }
        prev = root;
        inOrderHelper(root->right, prev, diff);
    }
};

int main() {
    return 0;
}
