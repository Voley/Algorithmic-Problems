#include <iostream>
#include <string>

bool isSubstring(std::string complete, std::string part) {
    return complete.find(part) != std::string::npos;
}

bool isRotation(std::string first, std::string second) {
    if (first.size() == second.size()) {
        return isSubstring(first + first, second);
    }
    return false;
}

int main() {
    std::cout << "Is cab a rotation of abc? " << isRotation("abc", "cab") << std::endl;
    return 0;
}
