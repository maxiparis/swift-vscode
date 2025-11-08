
class NumArray {
    var nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var tmp = nums[left...right]
        var res = 0
        tmp.forEach { res += $0 }
        return res
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */