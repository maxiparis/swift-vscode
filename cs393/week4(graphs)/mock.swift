class Solution {
    func separateDigits(_ nums: [Int]) -> [Int] {
        var res: [Int] = []
        for num in nums {
            var stringified = String(num)
            for char in stringified {
                if let number = Int(String(char)) {
                    res.append(number)
                }
            }
        }
        return res
    }
}