class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0]}
        if nums.count == 2 { return max(nums[0], nums[1])}

        var a = Array(nums.dropLast())
        var b = Array(nums.dropFirst())

        func robHouse(_ array: [Int]) -> Int {
            if array.count == 0 { return array[0] }
            if array.count == 1 { return max(array[0], array[1])}

            var dp = Array(repeating: 0, count: array.count)
            dp[0] = array[0]
            dp[1] = max(array[0], array[1])

            for i in 2..<array.count {
                dp[i] = max(dp[i-2] + array[i], dp[i-1])
            }

            return dp.last!
        }

        return max(robHouse(a), robHouse(b))
    }
}


print(Solution().rob([0]))