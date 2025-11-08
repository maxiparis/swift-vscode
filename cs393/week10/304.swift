
class NumMatrix {
    var matrix: [[Int]]
    var rectangles: [[Int]] //up to that point, from the origin
    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        var rows = matrix

        // Rows
        for rowi in 0..<matrix.count {
            var runningSum = 0
            for coli in 0..<matrix[0].count {
                runningSum += matrix[rowi][coli]
                rows[rowi][coli] = runningSum
            }
        }

        rectangles = rows
        
        // Rectangles
        for rowi in 1..<matrix.count {
            for coli in 0..<matrix[0].count {
                rectangles[rowi][coli] = rows[rowi][coli] + rectangles[rowi-1][coli]
            }
        }

        // rows.forEach { print($0) }
        // print("\n")
        // rectangles.forEach { print($0) }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return helper(row2, col2) - helper(row2, col1-1) - helper(row1-1, col2) + helper(row1-1, col1-1)
    }

    // inclusive row and col
    func helper(_ untilRow: Int, _ untilCol: Int) -> Int {
        //TODO, handle edge cases
        guard untilRow >= 0 && untilCol >= 0 else { return 0 }
        return rectangles[untilRow][untilCol]
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */

 let obj = NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]])
// print(obj.helper(2, 2)) 
print(obj.sumRegion(2, 1, 4, 3)) 
print(obj.sumRegion(1, 1, 2, 2)) 
print(obj.sumRegion(1, 2, 2, 4)) 