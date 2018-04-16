
#include <iostream>
#include <vector>

class Rectangle
{
private:
    // coordinates of bottom left corner
    int leftX_;
    int bottomY_;
    
    // dimensions
    int width_;
    int height_;
    
public:
    Rectangle() :
    leftX_(0),
    bottomY_(0),
    width_(0),
    height_(0){}
    
    Rectangle(int leftX, int bottomY, int width, int height) :
    leftX_(leftX),
    bottomY_(bottomY),
    width_(width),
    height_(height){}
    
    int getLeftX() const
    {
        return  leftX_;
    }
    
    int getBottomY() const
    {
        return  bottomY_;
    }
    
    int getWidth() const
    {
        return  width_;
    }
    
    int getHeight() const
    {
        return  height_;
    }
    
    bool operator==(const Rectangle& other) const
    {
        return
        leftX_ == other.leftX_
        && bottomY_ == other.bottomY_
        && width_ == other.width_
        && height_ == other.height_;
    }
    
    bool operator!=(const Rectangle& other) const
    {
        return !(*this == other);
    }
    
    Rectangle intersection(const Rectangle& other) {
        // horizontal collision
        auto horizontal = lineIntersection(getLeftX(), getLeftX() + getWidth(), other.getLeftX(), other.getLeftX() + other.getWidth());
        
        // vertical collision
        auto vertical = lineIntersection(getBottomY(), getBottomY() + getHeight(), other.getBottomY(), other.getBottomY() + other.getHeight());
        
        if ((horizontal.first == 0 && horizontal.second == 0) || (vertical.first == 0 && vertical.second == 0)) {
            return Rectangle();
        }
        
        return Rectangle(horizontal.first, vertical.first, horizontal.second, vertical.second);
    }
    
    std::pair<int, int> lineIntersection(int a, int a1, int b, int b1) {
        int maxLeft = std::max(a, b);
        int minRight = std::min(a1, b1);
        
        int xIntersectionStart = 0;
        int xIntersectionWidth = 0;
        
        if (maxLeft <= minRight) {
            xIntersectionStart = maxLeft;
            xIntersectionWidth = minRight - maxLeft;
        }
        return std::pair<int, int>(xIntersectionStart, xIntersectionWidth);
    }
};

int main() {
    
    Rectangle a = Rectangle(0, 0, 10, 10);
    Rectangle b = Rectangle(5, 5, 2, 2);
    Rectangle c = a.intersection(b);
    
    std::cout << c.getLeftX() << " " << c.getWidth() << std::endl;
    std::cout << c.getBottomY() << " " << c.getHeight() << std::endl;
    
    return 0;
}


