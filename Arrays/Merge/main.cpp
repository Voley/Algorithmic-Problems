#include <iostream>
#include <vector>

void merge(std::vector<int>& nums1, int m, std::vector<int>& nums2, int n) {
    int a = m - 1;
    int b = n - 1;
    int end = m + n - 1;
    
    while (a >= 0 && b >= 0) {
        if (nums1[a] > nums2[b]) {
            nums1[end--] = nums1[a--];
        } else {
            nums1[end--] = nums2[b--];
        }
    }
    while (b >= 0) {
        nums1[end--] = nums2[b--];
    }
}

int main() {
    std::vector<int> v1 {1, 3, 5, 7, 0, 0, 0};
    std::vector<int> v2 {2, 4, 6};
    merge(v1, 4, v2, 3);
    for (auto i: v1) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    return 0;
}
