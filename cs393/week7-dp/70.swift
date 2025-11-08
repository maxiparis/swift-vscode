class Solution {
    var cache: [Int:Int] = [1:1, 2:2]

    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        if let res = cache[n] {
            return res
        }
        let res2 = climbStairs(n-1) + climbStairs(n-2)
        cache[n] = res2
        return res2
    }
}