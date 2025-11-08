// // memoization
class Solution {
    var cache: [Int:Int] = [:]
    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        if let res = cache[n] {
            return res
        }
        var res = fib(n-1) + fib(n-2)
        cache[n] = res

        return res
    }
}

// tabulation
class Solution {
    func fib(_ n: Int) -> Int {
        var res = Array(repeating: Int.max, count: n+1)
        for i in 0...n {
            if i <= 1 {
                res[i] = i
            } else {
                res[i] = res[i-1] + res[i-2]
            }
        }

        return res[n]
    }
}

print(Solution().fib(2))