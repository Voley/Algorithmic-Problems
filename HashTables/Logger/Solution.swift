class Logger {
    var map: Dictionary<String, Int> = [:]
    
    func shouldLog(_ message: String, _ timestamp: Int) -> Bool {
        if let last = map[message] {
            if last - timestamp >= 10 {
                map[message] = timestamp
                return true
            }
        } else {
            map[message] = timestamp
            return true
        }
        return false
    }
}
