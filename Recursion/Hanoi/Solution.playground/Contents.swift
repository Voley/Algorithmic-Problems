/*
 Towers of Hanoi
     In the classic problem of the Towers of Hanoi, you have 3 towers and N disks of different sizes which can slide onto any tower. The puzzle starts with disks sorted in ascending order of size from top to bottom (i.e., each disk sits on top of an even larger one). You have the following constraints:
 
     (1) Only one disk can be moved at a time
     (2) A disk is slid off the top of one tower onto another tower
     (3) A disc cannot be placed on top of smaller disk
     Write a program to move the disks from the first tower to the last using stacks.
*/

func hanoi(_ numberOfDisks: Int, _ from: inout Array<Int>, _ buffer: inout Array<Int>, _ target: inout Array<Int>) {
    if numberOfDisks == 1 {
        if let item = from.popLast() {
            if let below = target.last {
                if below < item {
                    print("ERROR!")
                }
            }
            target.append(item)
        }
    } else {
        hanoi(numberOfDisks - 1, &from, &target, &buffer)
        hanoi(1, &from, &buffer, &target)
        hanoi(numberOfDisks - 1, &buffer, &from, &target)
    }
}


var first: [Int] = [5, 4, 3, 2 ,1]
var second: [Int] = []
var third: [Int] = []

hanoi(5, &first, &second, &third)

print(third)
