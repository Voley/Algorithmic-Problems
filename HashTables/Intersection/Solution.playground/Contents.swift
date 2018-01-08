func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var set = Set<Int>()  // element, count
    for el in nums1 {
        set.insert(el)
    }
    var result = [Int]()
    for el in nums2 {
        if set.contains(el) {
            result.append(el)
            set.remove(el)
        }
    }
    return result
}

print(intersection([1, 1, 2, 2], [2, 2]))
