class Solution {
    func solve(_ board: inout [[Character]]) {
        //identify the o's in the border
            //do dfs and mark them as T's
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if ([0, board.count-1].contains(row) || [0, board[0].count-1].contains(col)) && board[row][col] == "O" {
                    dfs(row, col)
                }
            }
        }

        func dfs(_ row: Int, _ col: Int) {
            guard ((0..<board.count) ~= row) && ((0..<board[0].count) ~= col) && board[row][col] == "O" else { return }

            board[row][col] = "T"
        
            dfs(row+1, col)
            dfs(row-1, col)
            dfs(row, col+1)
            dfs(row, col-1)
        }

        //mark everything that is not T as X
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if board[row][col] == "O" {
                    board[row][col] = "X"
                }
            }
        }
        //mark all Ts as O
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if board[row][col] == "T" {
                    board[row][col] = "O"
                }
            }
        }
    }
}


var a: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
print(Solution().solve(&a))
print(a)