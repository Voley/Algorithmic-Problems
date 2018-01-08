enum CalculatorOperator {
    case none
    case add
    case sub
    case mult
    case div
}

func calculate(_ s: String) -> Int {
    let input = Array(s)
    var operators = Stack<CalculatorOperator>()
    var numbers = Stack<Int>()
    var runningNumber = 0
    
    for ch in input {
        if isDecimal(ch) {
            if runningNumber > 0 {
                runningNumber *= 10
                runningNumber += Int(String(ch)) ?? 0
            } else {
                runningNumber = Int(String(ch)) ?? 0
            }
        } else if isOperator(ch) {
            numbers.push(runningNumber)
            runningNumber = 0
            let op = parseOperator(ch)
            collapseTop(op, &numbers, &operators)
            operators.push(op)
        }
    }
    
    if runningNumber != 0 {
        numbers.push(runningNumber)
    }
    
    collapseTop(.none, &numbers, &operators)
    
    return numbers.pop() ?? 0
}

func collapseTop(_ futureOp: CalculatorOperator, _ nums: inout Stack<Int>, _ ops: inout Stack<CalculatorOperator>) {
    
    while !ops.isEmpty() && nums.count() >= 2 {
        if priority(futureOp) <= priority(ops.peek()!) {
            let second = nums.pop() ?? 0
            let first = nums.pop() ?? 0
            let op = ops.pop() ?? .add
            let result = process(op, first, second)
            nums.push(result)
        } else {
            break
        }
    }
}

func process(_ op: CalculatorOperator, _ a: Int, _ b: Int) -> Int {
    switch op {
    case .add:
        return a + b
    case .sub:
        return a - b
    case .mult:
        return a * b
    case .div:
        return a / b
    default:
        return 0
    }
}

func priority(_ op: CalculatorOperator) -> Int {
    if op == .mult || op == .div {
        return 2
    }
    if op == .add || op == .sub {
        return 1
    }
    return 0
}

func parseOperator(_ ch: Character) -> CalculatorOperator {
    if ch == "+" {
        return .add
    } else if ch == "-" {
        return .sub
    } else if ch == "/" {
        return .div
    }
    return .mult
}

func isDecimal(_ ch: Character) -> Bool {
    let set = Set<Character>(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
    if set.contains(ch) {
        return true
    }
    return false
}

func isOperator(_ ch: Character) -> Bool {
    let set = Set<Character>(["+", "-", "/", "*"])
    if set.contains(ch) {
        return true
    }
    return false
}

class Stack<T> {
    private var storage: Array<T> = []
    
    func count() -> Int {
        return storage.count
    }
    
    func isEmpty() -> Bool {
        return storage.count == 0
    }
    
    func pop() -> T? {
        return storage.popLast()
    }
    
    func peek() -> T? {
        return storage.last
    }
    
    func push(_ value: T) {
        storage.append(value)
    }
}

print(calculate("0-2147483647"))
