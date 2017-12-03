#include <iostream>
#include <string>
#include <vector>

int coins(int n) {
    std::vector<int> coins {1, 5, 10, 25};
    std::vector<int> f;
    f.resize(n + 1);
    
    f[0] = 1;
    
    for (int i = 0; i < coins.size(); i++) {
        for (int j = 1; j <= n; j++) {
            if (j >= coins[i]) {
                f[j] = f[j] + f[j - coins[i]];
            }
        }
    }
    return f[n];
}

int main() {
    std::cout << coins(6) << std::endl;
    std::cout << coins(11) << std::endl;
    std::cout << coins(100) << std::endl;
    return 0;
}



