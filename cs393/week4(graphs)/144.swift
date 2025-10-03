class Solution {
    var a = Array<Int>()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        traverse(root)
        return a
    }

    func traverse(_ node: TreeNode?) {
        guard node != nil else { return }
        let n = node!
        
        a.append(n.val)
        traverse(n.left)
        traverse(n.right)
    }
}