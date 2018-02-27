#include <iostream>
#include <sstream>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Codec {
public:
    
    // Encodes a tree to a single string.
    std::string serialize(TreeNode* root) {
        std::ostringstream stream;
        se(root, stream);
        return stream.str();
    }
    
    // Decodes your encoded data to tree.
    TreeNode* deserialize(std::string data) {
        std::istringstream stream {data};
        return de(stream);
    }
    
    TreeNode* de(std::istringstream & stream) {
        std::string temp;
        stream >> temp;
        if (temp == "n") {
            return nullptr;
        } else {
            int value = stoi(temp);
            TreeNode *temp = new TreeNode(value);
            temp->left = de(stream);
            temp->right = de(stream);
            return temp;
        }
        
        return nullptr;
    }
    
    void se(TreeNode* node, std::ostringstream & stream) {
        if (!node) {
            stream << "n ";
        } else {
            stream << std::to_string(node->val) << " ";
            se(node->left, stream);
            se(node->right, stream);
        }
    }
};

int main() {
    return 0;
}
