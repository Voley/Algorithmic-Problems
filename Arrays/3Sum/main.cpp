#include <iostream>
#include <vector>
#include <string>

using namespace std;

vector<vector<int>> threeSum(vector<int>& nums);

int main() {
    
    vector<int> v;
    v.push_back(-1);
    v.push_back(0);
    v.push_back(1);
    v.push_back(2);
    v.push_back(-1);
    v.push_back(-4);
    
    auto z = threeSum(v);
    
    for (auto i: z) {
        for (auto j: i) {
            cout << j << " ";
        }
        cout << endl;
    }
    
    return 0;
}

vector<vector<int>> threeSum(vector<int>& nums) {
    vector<vector<int>> result;
    if (nums.size() < 3) {
        return result;
    }
    
    sort(nums.begin(), nums.end());
    
    for (int i = 0; i < nums.size() - 2; i++) {
        while (i > 0 && nums[i] == nums[i - 1]) {
            i++;
        }
        int first = i + 1;
        int last = nums.size() - 1;
        
        while (first < last) {
            int sum = nums[i] + nums[first] + nums[last];
            if (last < nums.size() - 1 && nums[last] == nums[last + 1]) {
                last--;
            } else if (sum == 0) {
                vector<int> v;
                v.push_back(nums[i]);
                v.push_back(nums[first]);
                v.push_back(nums[last]);
                result.push_back(v);
                first++;
                last--;
                while (first < last && nums[first] == nums[first - 1]) {
                    first++;
                }
                while (last > first && nums[last] == nums[last + 1]) {
                    last--;
                }
                
                
            } else if (sum > 0) {
                last--;
            } else if (sum < 0) {
                first++;
            }
        }
    }
    return result;
}

