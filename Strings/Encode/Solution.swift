import Foundation

class Encoder {
    private var storage = Dictionary<String, String>()
    private var pool = Array("qwertyuiopasdfghjklzxcvbnm1234567890")
    
    func encode(_ str: String) -> String {
        var seq = ""
        repeat {
            seq = randomSequence()
        } while storage[seq] != nil
        storage[seq] = str
        return seq
    }
    
    func decode(_ str: String) -> String {
        if let result = storage[str] {
            return result
        }
        return ""
    }
    
    func randomSequence() -> String {
        var str = ""
        for _ in 0..<6 {
            let c = pool[rand(pool.count)]
            str.append(c)
        }
        return str
    }
    
    func rand(_ upper: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upper)))
    }
}

let coder = Encoder()
print(coder.decode(coder.encode("abc")))
