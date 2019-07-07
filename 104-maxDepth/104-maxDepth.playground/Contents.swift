/**
给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

说明: 叶子节点是指没有子节点的节点。

示例：
给定二叉树 [3,9,20,null,null,15,7]，
 
  3
 / \
9  20
  /  \
 15   7
返回它的最大深度 3 。
 
思路：递归。
 
 
时间复杂度：O(n)
空间复杂度：O(log(n))
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func isMirror(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil { return true }
        guard let p = p, let q = q else { return false }
        return p.val == q.val && isMirror(p.right, q.left) && isMirror(p.left, q.right)
    }
        
    func maxDepth(_ root: TreeNode?) -> Int {
        return 0
    }
}

let test = Solution()
var p = TreeNode(0)
p.left = TreeNode(9)
p.right = TreeNode(20)
p.right?.left = TreeNode(15)
p.right?.right = TreeNode(7)

print(test.maxDepth(p))


