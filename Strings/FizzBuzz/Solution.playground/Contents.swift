func fizzBuzz(_ n: Int) -> [String] {
    var result = [String]()
    for i in 1...n {
        var temp = ""
        if i % 3 == 0 {
            temp.append("Fizz")
        }
        if i % 5 == 0 {
            temp.append("Buzz")
        }
        
        if i % 3 > 0 && i % 5 > 0 {
            temp.append("\(i)")
        }
        result.append(temp)
    }
    return result
}

print(fizzBuzz(15))
