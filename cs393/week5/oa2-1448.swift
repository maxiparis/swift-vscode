public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root else { return 0 } 
        
        func dfs(_ node: TreeNode?, _ array: Set<Int>) {
            guard let node else { return }

            var array = array

            if array.allSatisfy { $0 <= node.val } {
                count += 1
            }

            array.insert(node.val)
            dfs(node.left, array)
            dfs(node.right, array)
        }


        var count = 1
        dfs(root.left, [root.val])
        dfs(root.right, [root.val])

        return count
    }
}