/*
 Implement int sqrt(int x).
*/

func mySqrt(_ x: Int) -> Int {
    var left = 1
    var right = x
    while left <= right {
        let mid = left + (right - left) / 2
        if mid == x / mid {
            return mid
        } else if mid < x / mid {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return right
}
        
print(mySqrt(999))

