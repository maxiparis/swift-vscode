class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var wordSet = Set(wordDict)
        var sArrary = Array(s)
        var dp = Array(repeating: false, count: s.count+1)
        dp[0] = true

        for r in 1..<dp.count {
            for l in 0..<r {
                if dp[l] {
                    //check if the word from l to r exists in the wordset
                    var word = String(sArrary[l...r-1])
                    if wordSet.contains(word) {
                        dp[r] = true
                        break
                    }
                }
            }
        }

        return dp[s.count]
    }
}


print(Solution().wordBreak("leetcode", ["leet", "code"]))
