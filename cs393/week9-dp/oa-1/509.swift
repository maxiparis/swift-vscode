class Solution {
    var cache: [Int] = []
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }

        if let found = cache[n] {
            return found
        }

        var res = fib(n-1) + fib(n-2)
        cache[n] = res
        
        return res
    }
}


class Solution {
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        
        return fib(n-1) + fib(n-2)
    }
}

print(Solution().fib(4))