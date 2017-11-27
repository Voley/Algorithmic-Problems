/*
 Triple Step
    A child is running up a staircase with n steps and can hop either 1 step, 2 steps, or 3 steps at a time. Implement a method to count how many possible ways the child can run up the stairs.
 */

func steps(_ value: Int) -> Int {
    var arr = [Int](repeatElement(0, count: value + 1))
    arr[0] = 1
    arr[1] = 2
    arr[2] = 3
    for i in 3..<value{
        arr[i] = arr[i - 1] + arr[i - 2] + arr [i - 3]
    }
    return arr[value - 1]
}

print(steps(4))
