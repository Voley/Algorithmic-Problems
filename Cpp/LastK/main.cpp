#include <iostream>
#include <vector>
#include <string>
#include <fstream>

void printLastNLines(int n, std::string filename) {
    std::fstream file (filename);
    std::vector<std::string> vec(n, "");
    int size = 0;
    
    while (file.peek() != EOF) {
        getline(file, vec[size % n]);
        size++;
    }
    
    int start = size > n ? (size % n) : 0;
    int count = std::min(n, size);
    
    for (int i = 0; i < count; i++) {
        std::cout << vec[(start + i) % n] << std::endl;
    }
}

int main() {
    printLastNLines(2, "README.md");
    return 0;
}
