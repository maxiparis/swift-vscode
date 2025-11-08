// class Solution {
//     func rob(_ nums: [Int]) -> Int {
//         guard nums.count > 1 else { return nums[0] }

//         var dp = Array(repeating: 0, count: nums.count) // up to index position, this is the highest value
//         dp[0] = nums[0]
        

//         for i in 1..<nums.count { 
//             //find out the max for that value
//             var prevTwo = i >= 2 ? dp[i-2] : 0
//             dp[i] = max(dp[i-1], nums[i] + prevTwo)
//         }

//         return dp[nums.count-1]
//     }
// }



class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }

        var prev1 = 0
        var prev2 = 0
        
        for i in 0..<nums.count { 
            //find out the max for that value
            var tmp = prev1
            prev1 = max(prev1, nums[i] + prev2)
            prev2 = tmp
        }

        return prev1
    }
}


/**
* Things learned:
* - think: do I actually need to keep track of everything? or do I just need to know the last 1 or 2 computations?
* 
*   
*
**/