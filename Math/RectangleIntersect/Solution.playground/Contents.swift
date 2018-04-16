  struct Rectangle: CustomStringConvertible {
    
    // coordinates of bottom left corner
    let leftX: Int
    let bottomY: Int
    
    // dimensions
    let width: Int
    let height: Int
    
    init(leftX: Int, bottomY: Int, width: Int, height: Int) {
        self.leftX = leftX
        self.bottomY = bottomY
        self.width = width
        self.height = height
    }
    
    init() {
        self.init(leftX: 0, bottomY: 0, width: 0, height: 0)
    }
    
    var description: String {
        return "\(leftX), \(bottomY), \(width), \(height)"
    }
    
    struct Point {
        var a: Int
        var b: Int
    }
    
    func intersection(_ other: Rectangle) -> Rectangle? {
        
        // horizontal
        guard let horizontal = lineIntersection(leftX, leftX + width, other.leftX, other.leftX + other.width) else { return nil }

        //vertical
        guard let vertical = lineIntersection(bottomY, bottomY + height, other.bottomY, other.bottomY + other.height) else { return nil }
        
        return Rectangle(leftX: horizontal.a, bottomY: vertical.a, width: horizontal.b - horizontal.a, height: vertical.b - vertical.a)
    }
    
    private func lineIntersection(_ a0: Int, _ a1: Int, _ b0: Int, _ b1: Int) -> Point? {
        let maxStart = max(a0, b0)
        let minEnd = min(a1, b1)
        
        if maxStart >= minEnd {
            return nil
        }
        return Point(a: maxStart, b: minEnd)
    }
  }

  let a = Rectangle(leftX: 0, bottomY: 0, width: 10, height: 10)
  let b = Rectangle(leftX: 5, bottomY: 5, width: 2, height: 2)
  
  if let c = a.intersection(b) {
    print(c)
  }
  
  
