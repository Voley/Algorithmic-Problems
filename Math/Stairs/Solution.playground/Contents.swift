/*
   Climbing Stairs
     You are climbing a stair case. It takes n steps to reach to the top.
     Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
     Note: Given n will be a positive integer.
 */

func climbStairs(_ n: Int) -> Int {
    
    if n == 1 || n == 2 {
        return n
    }
    
    var first = 1
    var second = 2
    var third = 0
    
    for _ in 3 ..< n + 1 {
        third = first + second
        first = second
        second = third
    }
    return third
}
