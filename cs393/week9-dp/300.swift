class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int?] = Array(repeating: nil, count: nums.count)

        // returns the longest increasing subsequence if we en in that index
        func traverse(from index: Int) -> Int {
            // print("traverse from nums[\(index)] = \(nums[index])")
            if let cached = dp[index] { return cached }

            var res = 1 // base case

            for i in 0..<index {
                if nums[i] < nums[index] {
                    res = max(res, traverse(from: i) + 1)
                }
            }

            dp[index] = res
            return res
        }

        var res = 1

        for i in 0..<nums.count {
            res = max(res, traverse(from: i))
        }
        
        return res
    }
}


print(Solution().lengthOfLIS([1,3,6,7,9,4,10,5,6]))
