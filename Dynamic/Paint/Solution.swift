    func numWays(_ n: Int, _ k: Int) -> Int {
        guard n > 0 && k > 0 else { return 0 }
        var memo = Array(repeating:0, count:n + 1)
        for i in 0...n {
            if i == 0 {
                memo[i] = 0
            } else if i == 1 {
                
                // there are k ways to paint first
                
                memo[i] = k
            } else if i == 2 {
                
                // k * k ways to paint second
                memo[i] = k * k
            } else {
                
                // magic ways to paint third
                
                memo[i] = (memo[i - 2] + memo[i - 1]) * (k - 1)
            }
        }
        return memo[n]
    }
