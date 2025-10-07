

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var minn = Int.max

        func trav(_ node: TreeNode?, _ currentDepth: Int) {
            guard let node else { return }

            if node.right == nil && node.left == nil {
                minn = min(minn, currentDepth + 1)
            }
            
            if let right = node.right {
                trav(right, currentDepth+1)
            }

            if let left = node.left {
                trav(left, currentDepth+1)
            }
        }   

        trav(root?.left, 1)
        trav(root?.right, 1)


        return minn == Int.max ? 1 : minn
    }
}