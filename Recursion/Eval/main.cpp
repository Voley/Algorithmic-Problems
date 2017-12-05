#include <iostream>
#include <string>
#include <vector>
#include <cmath>
#include <algorithm>

class Box {
    int width;
    int height;
    int length;
    
public:
    int getWidth() {
        return width;
    }
    int getHeight() {
        return height;
    }
    int getLength() {
        return length;
    }
    
    bool canBePlacedAbove(Box& other) {
        return other.getHeight() > height && other.getWidth() > width && other.getLength() > getLength();
    }
    
    Box(int w, int h, int l) {
        width = w;
        height = h;
        length = l;
    }
};

int createStack(const std::vector<Box>& boxes, Box* bottom, int offset, std::vector<int> heights) {
    if (offset >= boxes.size()) {
        return 0;
    }

    int heightWithNewBottom = 0;
    Box newBottom = boxes[offset];
    if (bottom == NULL || newBottom.canBePlacedAbove(*bottom)) {
        if (heights[offset] == 0) {
            heights[offset] = createStack(boxes, &newBottom, offset + 1, heights);
            heights[offset] += newBottom.getHeight();
        }
        heightWithNewBottom = heights[offset];
    }
    
    int heightWithSkippingBottom = createStack(boxes, bottom, offset + 1, heights);
    
    return std::max(heightWithNewBottom, heightWithSkippingBottom);
}

int stack(std::vector<Box> boxes) {
    sort(boxes.begin(), boxes.end(), [] (Box& lhs, Box& rhs) {
        return lhs.getHeight() > rhs.getHeight();
    });
    std::vector<int> heights;
    heights.resize(boxes.size());
    return createStack(boxes, NULL, 0, heights);
}

int main() {
    
    Box b1 = Box(1, 1, 1);
    Box b2 = Box(2, 2, 2);
    Box b3 = Box(3, 3, 3);
    Box b4 = Box(4, 4, 4);
    
    std::vector<Box> vec {b1, b2, b3, b4};
    std::cout << stack(vec) << std::endl;
    return 0;
}
