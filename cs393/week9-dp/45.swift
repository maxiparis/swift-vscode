class Solution {
    func jump(_ nums: [Int]) -> Int {
        if nums.count == 1 { return 0 }
        if nums.count == 2 { return 1}

        var dp: [Int?] = Array(repeating: nil, count: nums.count)
        dp[0] = 0

        //returns the minimum amount of jumps to reach this position
        func traverseBack(from index: Int) -> Int {
            if let res = dp[index] {
                return res
            }


            var r = Int.max // the minimun found
            for i in 0..<index {
                if i + nums[i] >= index {
                    r = min(r, traverseBack(from: i) + 1)
                }
            }

            dp[index] = r
            return r
        }

        traverseBack(from: nums.count - 1)


        return dp[nums.count-1]!
    }
}

print(Solution().jump([2,3,1]))
