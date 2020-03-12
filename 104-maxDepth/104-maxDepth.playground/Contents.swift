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
 
思路：递归。(和二叉树相关的问题大部分可以用递归解决)

递归的终止条件是：当前节点为空
节点不为空时，每次递归计算的是：左右子树的高度的最大值，同时加1表示当前节点的高度，返回该数值 
按照上面的讨论即可写出代码
 
这种解法也称为 DFS（深度优先搜索）
 
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
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let left = maxDepth(root?.left)
        let right = maxDepth(root?.right)
        return max(left, right) + 1
    }
}

let test = Solution()
var p = TreeNode(0)
p.left = TreeNode(9)
p.right = TreeNode(20)
p.right?.left = TreeNode(15)
p.right?.right = TreeNode(7)

print(test.maxDepth(p))
