func numIdenticalPairs(_ nums: [Int]) -> Int {
    var found = 0
    for (index, outerNum) in nums.enumerated() {
        
        for innerIndex in index+1..<nums.count {
            if outerNum == nums[innerIndex] { found += 1 }
        }
    }
    return found 
}


var a = [1,2,3,1,1,3]

print(numIdenticalPairs(a))

