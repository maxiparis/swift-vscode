class Solution {
    func tribonacci(_ n: Int) -> Int {
        var cache: [Int?] = Array(repeating: nil, count: n+1)

        func helper(_ n: Int) -> Int {
            if n == 0 { return 0 }
            if n <= 2 { return 1 }

            if let found = cache[n] {
                return found
            }

            var res = helper(n-3) + helper(n-2) + helper(n-1)
            cache[n] = res

            return res
        }


        return helper(n)
    }
}


print(Solution().tribonacci(4))

