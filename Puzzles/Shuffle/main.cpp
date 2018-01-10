#include <iostream>
#include <vector>
#include <ctime>

void shuffle(std::vector<int>& cards) {
    if (cards.size() < 2) {
        return;
    }
    srand(time(0));
    for (int i = 0; i < cards.size() - 1; i++) {
        int random = rand() % (cards.size() - 1);
        std::swap(cards[i], cards[random]);
    }
}

int main() {
    std::vector<int> nums {1, 2, 3, 4, 5};
    shuffle(nums);
    for (auto& i: nums) {
        std::cout << i << std::endl;
    }
    return 0;
}
