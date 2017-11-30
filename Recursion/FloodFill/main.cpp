#include <iostream>
#include <vector>
#include <algorithm>

void floodHelper(std::vector<std::vector<int>>& image, int sr, int sc, int oldColor, int newColor);

std::vector<std::vector<int>> floodFill(std::vector<std::vector<int>>& image, int sr, int sc, int newColor) {
    int oldColor = image[sr][sc];
    floodHelper(image, sr, sc, oldColor, newColor);
    return image;
}

void floodHelper(std::vector<std::vector<int>>& image, int sr, int sc, int oldColor, int newColor) {
    
    if (sr < 0 || sc < 0 ||
        sr > image.size() - 1 ||
        sc > image[0].size()  - 1 ||
        image[sr][sc] != oldColor ||
        oldColor == newColor) {
        return;
    }
    image[sr][sc] = newColor;
    floodHelper(image, sr + 1, sc, oldColor, newColor);
    floodHelper(image, sr - 1, sc, oldColor, newColor);
    floodHelper(image, sr, sc + 1, oldColor, newColor);
    floodHelper(image, sr, sc - 1, oldColor, newColor);
}

int main() {
    
    std::vector<std::vector<int>> vec {{0, 1, 0}, {1, 1, 1}, {0, 1, 0}};
    auto vec2 = floodFill(vec, 0, 1, 2);
    
    for (auto z: vec2) {
        for (auto x: z) {
            std::cout << x << " ";
        }
        std::cout << std::endl;
    }
    
    return 0;
}
