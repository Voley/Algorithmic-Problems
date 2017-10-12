
//  main.cpp

#include <iostream>
#include <map>
#include <string>


bool isOneEditAway(const std::string& first, const std::string& second);
bool isEditingAway(const std::string& first, const std::string& second);
bool isInsertionAway(const std::string& first, const std::string& second);
void checkOneEdit(const std::string& first, const std::string& second);

int main() {
    checkOneEdit("abc", "abd");
    checkOneEdit("ab", "abc");
    checkOneEdit("ab", "abcd");
    checkOneEdit("ac", "a");
    checkOneEdit("abz", "abc");
    checkOneEdit("Himalayas", "Himaleyas");
    checkOneEdit("Himalayas", "Himaeyas");
    return 0;
}

bool isOneEditAway(const std::string& first, const std::string& second) {
    
    if (abs(int(first.size() - second.size())) > 1) {
        return false;
    }
    
    if (first.size() == second.size()) {
        return isEditingAway(first, second);
    } else if (first.size() + 1 == second.size()) {
        return isInsertionAway(first, second);
    } else if (first.size() == second.size() + 1) {
        return isInsertionAway(second, first);
    }
    return false;
}

bool isEditingAway(const std::string& first, const std::string& second) {
    int index = 0;
    bool foundEdit = false;
    while (index < first.size()) {
        if (first[index] != second[index]) {
            if (!foundEdit) {
                foundEdit = true;
            } else {
                return false;
            }
        }
        index++;
    }
    return true;
}
bool isInsertionAway(const std::string& first, const std::string& second) {
    int firstIndex = 0;
    int secondIndex = 0;
    bool foundInsert = false;
    
    while (firstIndex < first.size() && secondIndex < second.size()) {
        if (first[firstIndex] != second[secondIndex]) {
            if (!foundInsert) {
                foundInsert = true;
                secondIndex++;
            } else {
                return false;
            }
        } else {
            firstIndex++;
            secondIndex++;
        }
    }
    return true;
}

void checkOneEdit(const std::string& first, const std::string& second) {
    std::cout << "Is \"" << first << "\"" << " one edit away from \"" << second << "\"? ";
    std::cout << isOneEditAway(first, second);
    std::cout << std::endl;
}
