func twoSum(_ array: [Int], _ target: Int) -> (Int, Int) {
    for i in 0..<array.count {
        let index = array.dropFirst(i+1).firstIndex(of: target - array[i])
        
        if let index {
            return (i, index)
        }
    }
    return (0, 0)
}


// print(twoSum([2, 7, 11, 15], 9))
print(twoSum([2, 7, 3, 3, 7, 19], 6))