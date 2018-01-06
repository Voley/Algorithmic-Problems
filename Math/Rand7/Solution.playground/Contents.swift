import Foundation

func rand7() -> Int {
    var result = 0
    repeat {
        result = rand5() * 5 + rand5()
    } while result > 21
    return  result % 7
}

func rand5() -> Int {
    return Int(arc4random_uniform(5))
}

print(rand7())
