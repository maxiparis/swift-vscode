class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp:[Int] = Array(repeating: 0, count: cost.count)

        for i in stride(from: cost.count-1, through: 0, by: -1) {
            if i >= cost.count-2 {
                dp[i] = cost[i]
            } else {
                dp[i] = min(cost[i]+dp[i+1], cost[i]+dp[i+2])
            }
        }
        
        return min(dp[0], dp[1])
    }
}


print(Solution().minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]
))