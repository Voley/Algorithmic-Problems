#include <iostream>
#include <vector>
#include <unordered_map>
#include <stack>

std::vector<int> nextGreaterElement(std::vector<int>& findNums, std::vector<int>& nums) {
    
    if (findNums.empty()) {
        return findNums;
    }
    
    std::unordered_map<int, int> dict;
    std::stack<int> st;
    int prev = nums[0];
    for (int i: nums) {
        if (i > prev) {
            while (!st.empty()) {
                int temp = st.top();
                if (i > temp) {
                    dict[temp] = i;
                    st.pop();
                } else {
                    break;
                }
            }
        }
        st.push(i);
        prev = i;
    }
    std::vector<int> result;
    for (int i: findNums) {
        if (dict.count(i) > 0) {
            result.push_back(dict[i]);
        } else {
            result.push_back(-1);
        }
    }
    return result;
}

int main() {
    return 0;
}
