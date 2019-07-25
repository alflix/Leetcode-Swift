/**
 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例: 
 给定如下二叉树，以及目标和 sum = 22，
 
     5
    / \
   4   8
  /   / \
 11  13  4
 / \      \
7   2      1
 
返回 true, 因为存在目标和为 22 的根节点到叶子节点的路径 5->4->11->2。
 
 思路：递归。和 [104. 二叉树的最大深度](https://github.com/alflix/leetcode-swift/tree/master/104-maxDepth)
 相似。在求深度的过程中，增加判断是否深度差大于1即可
  
 时间复杂度：O(n)
 空间复杂度：O(log(n))
 */

import Foundation

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
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil { return false }
        if root?.left == nil && root?.right == nil {  return sum-root!.val == 0 }                
        return hasPathSum(root?.left, sum-root!.val) || hasPathSum(root?.right, sum-root!.val)
    }        
}

let test = Solution()
var p = TreeNode(5)
p.left = TreeNode(4)
p.left?.left = TreeNode(11)
p.left?.left?.left = TreeNode(7)
p.left?.left?.right = TreeNode(2)

p.right = TreeNode(8)
p.right?.left = TreeNode(13)
p.right?.right = TreeNode(4)
p.right?.right?.right = TreeNode(1)

print(test.hasPathSum(p, 22))
