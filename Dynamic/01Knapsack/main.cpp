#include <iostream>
#include <vector>

using std::vector;

// weight, value
int binaryKnapsack(int capacity, const vector<vector<int>>& weights) {
    auto v = weights;
    std::sort(v.begin(), v.end(), [](const vector<int>& lhs, const vector<int>rhs){
        return lhs[0] < rhs[0];
    });
    
    auto memo = vector<vector<int>>(v.size(), vector<int>(capacity + 1, 0));
    
    for (int i = 0; i < v.size(); i++) {
        auto weight = v[i][0];
        auto val = v[i][1];
        for (int j = 1; j <= capacity; j++) {
            if (weight > j) {
                memo[i][j] = i > 0 ? memo[i - 1][j] : 0;
            } else {
                // picking this value
                int a = 0;
                a = val;
                a += i > 0 ? memo[i - 1][j - weight] : 0;
                
                // not picking this value
                int b = i > 0 ? memo[i - 1][j] : 0;
                
                memo[i][j] = std::max(a, b);
            }
        }
    }
    
    return memo[weights.size() - 1][capacity];
}

int main() {
    std::cout << binaryKnapsack(50, {{10, 60}, {30, 120}, {20, 100}}) << std::endl;
    return 0;
}
