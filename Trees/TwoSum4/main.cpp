#include <iostream>
#include <vector>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

std::vector<int> toVector(TreeNode* root);
void vectorHelper(TreeNode *root, std::vector<int>& vecRef);

bool findTarget(TreeNode* root, int k) {
    std::vector<int> nums = toVector(root);
    int begin = 0;
    int end = nums.size() - 1;
    while (begin != end) {
        int sum = nums[begin] + nums[end];
        if (sum == k) {
            return true;
        } else if (sum > k) {
            end--;
        } else {
            begin++;
        }
    }
    return false;
}

std::vector<int> toVector(TreeNode* root) {
    std::vector<int> nums;
    vectorHelper(root, nums);
    return nums;
}

void vectorHelper(TreeNode *root, std::vector<int>& vecRef) {
    if (!root) {
        return;
    }
    vectorHelper(root->left, vecRef);
    vecRef.push_back(root->val);
    vectorHelper(root->right, vecRef);
}

int main() {
    return 0;
}
