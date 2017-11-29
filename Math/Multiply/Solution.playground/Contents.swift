/*
  Recursive Multiply
    Write a recursive function to multiply two positive integers without using the * operator. You can use addition, substraction and bit shifting, but you should minimize the number of those operations.
 */

func multiply(_ first: Int, _ second: Int) -> Int {
    let bigger = first > second ? first : second
    let smaller = first > second ? second : first
    return multiplyHelper(smaller, bigger)
}

func multiplyHelper(_ smaller: Int, _ larger: Int) -> Int {
    if smaller == 0 {
        return 0
    } else if smaller == 1 {
        return larger
    }
    
    let s = smaller >> 1
    let halfProd = multiplyHelper(s, larger)
    
    if smaller % 2 == 0 {
        return halfProd + halfProd
    } else {
        return halfProd + halfProd + larger
    }
}

print(multiply(77, 10))

