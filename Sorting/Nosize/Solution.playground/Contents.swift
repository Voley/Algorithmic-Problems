/*
   Sorted Search, No Size
    You are given an array-like data structure `Listy` which lacks a size method. It does, however have an `elementAt(i)` method that returns the element at index i in O(1) time. If i is beyond the bounds of data structure, it returns -1. Given a `Listy` of sorted, positive integers, find the index at which an element x occurs. If x occurs multiple times, you may return any index.
*/

class Listy {
    var data: Array<Int>
    
    func elementAt(_ i: Int) -> Int {
        if i >= data.count {
            return -1
        }
        return data[i]
    }
    
    init() {
        data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    }
}

func findItemIndex(_ list: Listy, _ item: Int) -> Int {
    
    var low = 0
    var high = 1
    
    while list.elementAt(high) != -1 && list.elementAt(high) < item {
        high *= 2
    }

    while high >= low {
        let mid = high - (high - low) / 2
        let found = list.elementAt(mid)
        if found == item {
            return mid
        } else if found == -1 || found > item {
            high = mid - 1
        } else if found < item {
            low = mid + 1
        }
    }
    return -1
}

let list = Listy()
print(findItemIndex(list, 7))


