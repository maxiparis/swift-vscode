class Solution {
    func solve(_ board: inout [[Character]]) {
        var toConvert: [[Int]] = [] // reset after every assessment

        for row in 0..<board.count {
            for col in 0..<board[0].count {
                print(row, col, " = \(board[row][col])")
                if board[row][col] == "O" {
                    if isRegion(row, col) {
                        print("isRegion")
                        // connect all toConvert
                        for pair in toConvert {
                            board[pair[0]][pair[1]] = "X"
                        }
                    }
                    toConvert = []
                }
            }
        }

        func isRegion(_ irow: Int, _ icol: Int) -> Bool {
            print("--isRegion in row \(irow) and col \(icol)) ")
            //remember to add to the toConvert 
            if irow == 0 || irow == board.count-1 || icol == 0 || icol == board[0].count-1 {
                return false
            }

            toConvert.append([irow, icol])
            
            if board[irow+1][icol] == "O" && !toConvert.contains([irow+1, icol]) && !isRegion(irow+1, icol) {
                return false
            }

            if board[irow-1][icol] == "O" && !toConvert.contains([irow-1, icol]) && !isRegion(irow-1, icol) {
                return false
            } 

            if board[irow][icol+1] == "O" && !toConvert.contains([irow, icol+1]) && !isRegion(irow, icol+1) {
                return false
            } 

            if board[irow][icol-1] == "O" && !toConvert.contains([irow, icol-1]) && !isRegion(irow, icol-1) {
                return false
            } 

            return true
        }
    }
}
var a: [[Character]] = [["O","O","O"],["O","O","O"],["O","O","O"]]
print(Solution().solve(&a))