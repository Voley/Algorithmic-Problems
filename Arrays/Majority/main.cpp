#include <iostream>
#include <vector>

int majority(std::vector<int> nums) {
    int n = 0;
    int counter = 0;
    for (int i = 0; i < nums.size(); i++) {
        if (counter == 0) {
            n = nums[i];
            counter = 1;
        } else if (n != nums[i]) {
            counter--;
        } else {
            counter++;
        }
    }
    return n;
}

int main() {
    std::vector<int> vec {1, 2, 2, 3, 2};
    std::cout << majority(vec) << std::endl;
    return 0;
}
