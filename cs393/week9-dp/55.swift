class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 1 { return true }
        var dp = Array(repeating: 0, count: nums.count)

        dp[0] = nums[0]
        if dp[0] == 0 { return false }

        if dp.count > 1 {
            for i in 1..<nums.count {
                dp[i] = max(nums[i], dp[i-1]-1)
                if dp[i] == 0 { break }
            }
        }

        return dp[nums.count-2] != 0 //returns the one
    }
}