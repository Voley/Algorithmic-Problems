/*
  Radix Sort
    Implement Radix Sort
*/

func radixSort(_ array: inout [Int] ) {
    let radix = 10
    var done = false
    var index = 0
    var digit = 1
    
    while !done {
        done = true
        var buckets = [[Int]]()
        for _ in 0..<radix {
            buckets.append([])
        }
        
        for number in array {
            index = number / digit
            buckets[index % radix].append(number)
            if done && index > 0 {
                done = false
            }
        }
        
        var i = 0
        for j in 0..<radix {
            let bucket = buckets[j]
            for number in bucket {
                array[i] = number
                i += 1
            }
        }
        digit *= radix
    }
}

var arr = [150, 4, 30, 2, 1]
radixSort(&arr)
print(arr)

