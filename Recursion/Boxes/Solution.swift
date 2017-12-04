/*
  Stack of Boxes
    You have a stack of n boxes, with widths w, height h and depths d. The boxes cannot be rotated and can only be stacked on top of one another if each box in the stack is strictly larger than the box above it in width, height and depth. Implement a method to compute the height of the tallest possible stack. The height of a stack is the sum of the heights of each box.
*/

func stack(_ boxes: Array<Box>) -> Int {
    let sorted = boxes.sorted(by: {$0.height > $1.height})
    var heights = [Int](repeatElement(0, count: boxes.count))
    return createStack(sorted, nil, 0, &heights)
}

func createStack(_ boxes: Array<Box>, _ bottom: Box?, _ offset: Int, _ stackMap: inout Array<Int>) -> Int {
    if offset >= boxes.count {
        return 0
    }
    
    // height with this bottom
    let newBottom = boxes[offset]
    var heightWithBottom = 0
    if bottom == nil || newBottom.canBeAbove(bottom) {
        if stackMap[offset] == 0 {
            stackMap[offset] = createStack(boxes, newBottom, offset + 1, &stackMap)
            stackMap[offset] += newBottom.height
        }
        heightWithBottom = stackMap[offset]
    }
    
    // without this bottom
    let heightWithoutBottom = createStack(boxes, bottom, offset + 1, &stackMap)
    
    return max(heightWithBottom, heightWithoutBottom)
}

class Box {
    var height: Int
    var width: Int
    var length: Int
    
    func canBeAbove(_ other: Box?) -> Bool {
        if other == nil {
            return false
        }
        return (other!.height > height) && (other!.width > width) && (other!.length > length)
    }
    
    init(_ w: Int, _ l: Int, _ h: Int) {
        height = h
        width = w
        length = l
    }
}

let b1 = Box(10, 10, 10)
let b2 = Box(4, 4, 4)
let b3 = Box(3, 3, 3)
let b4 = Box(2, 2, 2)
let b5 = Box(1, 1, 1)

print(stack([b3, b4, b1, b2, b5]))
