// https://leetcode.com/problems/valid-sudoku/description/


func isValidSudoku(_ board: [[Character]]) -> Bool {

    // check cols
    for i in 0..<9 {
        //checking row
        if arrayContainsRepetitiveElements(board[i]) { return false }

        var col = Array<Character>()
        for j in 0..<9 {
            let number = board[j][i]
            col.append(number)
            
            if (
                ((i == 0) && (j == 0 || j == 3 || j == 6)) ||
                ((i == 3) && (j == 0 || j == 3 || j == 6)) ||
                ((i == 6) && (j == 0 || j == 3 || j == 6))
            ) {
                //check for those squares around
                var threeByThree = Array<Character>()
                for r in 0..<3 {
                    let threeInRow = board[i+r][j..<j+3]
                    threeByThree.append(contentsOf: threeInRow)
                }
                if arrayContainsRepetitiveElements(threeByThree) { return false }

            }
        }

        //checking col
        if arrayContainsRepetitiveElements(col) { return false }
    }

    // check 3x3
    return true
}

// checks if any element in the array is repeated
func arrayContainsRepetitiveElements(_ array: [Character]) -> Bool {
    let s = Set(array)
    return array.count != s.count
}




// Testing stuff
// print(arrayContainsRepetitiveElements(["1", "2", "3"]))

var board: [[Character]] = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

print(isValidSudoku(board))