// https://leetcode.com/problems/coin-change/description/

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }

        func dp(_ objective: Int, _ cache: inout [Int:Int]) -> Int {
            if let cached = cache[objective] {
                return cached
            }

            var result = Int.max

            for coin in coins {
                if coin == objective {
                    result = 1
                    break
                } else if coin < objective {
                    var tmp = dp(objective - coin, &cache)
                    if  tmp != Int.max {
                        result = min(result, 1 + tmp)
                    }
                }
            }

            cache[objective] = result
            return result
        }
        var cache: [Int:Int] = [:]
        var res = dp(amount, &cache)

        return res == Int.max ? -1 : res
    }
}



print(Solution().coinChange([2], 3))