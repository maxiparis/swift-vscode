class Solution {
    var rowCount = Int.min
    var colCount = Int.min
    var color = Int.min
    var initialColor = Int.min
    var images: [[Int]] = [[]]

    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        self.images = image 
        self.rowCount = image.count //LEARNED TODAY
        self.colCount = image[0].count //LEARNED TODAY
        self.color = color
        self.initialColor = images[sr][sc]

        if self.initialColor != self.color {
            paint(sr, sc)
        }

        return images
    }

    func paint(_ row: Int, _ col: Int) {
        if ((0..<rowCount) ~= row) && ((0..<colCount) ~= col) && (images[row][col] == self.initialColor) { //LEARNED TODAY
            images[row][col] = color

            paint(row+1, col)
            paint(row-1, col)
            paint(row, col+1)
            paint(row, col-1)
            
        }
    }
}
var s = Solution()
// var a = [[1,1,1],[1,1,0],[1,0,1]]
var a = [[0,0,0],[0,0,0],[0,0,0]]

print(s.floodFill(a, 0, 0, 0))

// Write a recursive function that paints the pixel if it's the correct color, then recurses on neighboring pixels.