class Solution {
    var a = Array<Int>()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {

        return a
    }

    func traverse(_ node: TreeNode?) {
        guard node != nil else { return }

        traverse(node!.left)
        traverse(node!.right)

        a.append(node!.val)

    }
}