#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>

class Point {
    int x;
    int y;
public:
    Point(int xVal, int yVal) {
        x = xVal;
        y = yVal;
    }
    int getX();
    int getY();
    std::string stringRepresentation();
};

bool operator == (Point& lhs, Point& rhs) {
    return (lhs.getX() == rhs.getX()) && (lhs.getY() == rhs.getY());
}

std::string Point:: stringRepresentation() {
    return std::to_string(x) + " " + std::to_string(y);
}

int Point:: getX() {
    return x;
}

int Point:: getY() {
    return y;
}

std::vector<Point> recursivePath(Point start, Point end, std::vector<std::vector<bool>> availability, std::unordered_map<std::string, bool>& memo);

std::vector<Point> findPath(Point start, Point end, std::vector<std::vector<bool>> availability) {
    std::unordered_map<std::string, bool> map;
    return recursivePath(start, end, availability, map);
}

std::vector<Point> recursivePath(Point start, Point end, std::vector<std::vector<bool>> availability, std::unordered_map<std::string, bool>& memo) {
    
    if (memo.count(start.stringRepresentation()) > 0
        || start.getX() < 0
        || start.getX() > availability[0].size() - 1
        || start.getY() < 0
        || start.getY() > availability.size() - 1
        || !availability[start.getY()][start.getX()])
    {
        return std::vector<Point>();
    }
    
    memo[start.stringRepresentation()] = true;
    
    if (start == end) {
        return std::vector<Point>{start};
    }
    
    auto right = recursivePath(Point(start.getX() + 1, start.getY()), end, availability, memo);
    auto bottom = recursivePath(Point(start.getX(), start.getY() + 1), end, availability, memo);
    
    if (right.size() > 0) {
        std::vector<Point> result {start};
        result.insert(result.end(), right.begin(), right.end());
        return result;
    } else if (bottom.size() > 0) {
        std::vector<Point> result {start};
        result.insert(result.end(), bottom.begin(), bottom.end());
        return result;
    }
    return std::vector<Point>();
}

int main() {
    
    std::vector<std::vector<bool>> avail {{true, true, false, true, true},
                                         {true, true, false, true, true},
                                         {true, true, true, false, true},
                                         {true, true, true, false, true},
                                         {true, true, true, true, true},};
    
    auto vec = findPath(Point(0, 0), Point(4, 4), avail);
    for (auto p: vec) {
        std::cout << p.stringRepresentation() << std::endl;
    }
    
    return 0;
}
