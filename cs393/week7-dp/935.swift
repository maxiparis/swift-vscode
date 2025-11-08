import Foundation 

class Solution {
    func knightDialer(_ n: Int) -> Int {
        if n == 1 {
            return 10 
        }
        let map = [
            [4, 6],    // 0
            [6, 8],    // 1
            [7, 9],    // 2
            [4, 8],    // 3
            [3, 9, 0], // 4
            [],        // 5
            [1, 7, 0], // 6
            [2, 6],    // 7
            [1, 3],    // 8
            [4, 2]     // 9
        ]

        let MOD = Int(pow(10.0, 9)) + 7

        var dp = Array(repeating: 1, count: 10)

        for length in 2...n {
            var temp = Array(repeating: 0, count: 10)
            
            for digit in 0...9 {
                for nextDigit in map[digit] {
                    temp[nextDigit] = (temp[nextDigit] + dp[digit]) % MOD
                }
            }

            dp = temp
        }

        // ✓ Both of these work:
        return dp.reduce(0, +) % MOD
        // or: return dp.reduce(0) { ($0 + $1) % MOD }
    }
}

print(Solution().knightDialer(1))