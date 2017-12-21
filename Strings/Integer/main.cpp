#include <iostream>
#include <vector>
#include <string>

class Solution {
public:
    std::string singles[20] = {"Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};
    std::string tens[10] = {"Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};

    std::string numberToWords(int num) {
        if (num == 0) {
            return "Zero";
        }
        std::string result = helper(num);
        return result.substr(1);
    }

    std::string helper(int num) {
        if (num >= 1000000000) {
            return helper(num / 1000000000) + " Billion" + helper(num % 1000000000);
        } else if (num >= 1000000) {
            return helper(num / 1000000) + " Million" + helper(num % 1000000);
        } else if (num >= 1000) {
            return helper(num / 1000) + " Thousand" + helper(num % 1000);
        } else if (num >= 100) {
            return helper(num / 100) + " Hundred" + helper(num % 100);
        } else if (num >= 20) {
            return " " + tens[num / 10] + helper(num % 10);
        } else if (num >= 1) {
            return " " + singles[num];
        } else {
            return "";
        }
    }
};

int main() {
    Solution solution;
    std::cout << solution.numberToWords(1337) << std::endl;
    return 0;
}
