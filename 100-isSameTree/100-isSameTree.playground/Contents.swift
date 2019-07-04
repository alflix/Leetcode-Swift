/**
 给定两个二叉树，编写一个函数来检验它们是否相同。
 
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 
 示例 1: 
 输入:
 1         1
 / \       / \
 2   3     2   3
 
 [1,2,3],   [1,2,3] 
 输出: true
 
 示例 2:
 输入:
 1          1
 /           \
 2             2
 
 [1,2],     [1,null,2]
 输出: false
 
 示例 3:
 输入:
 1          1
 / \       / \
 2   1     1   2
 
 [1,2,1],   [1,1,2]
 输出: false
 
 思路：递归
 时间复杂度：O(n)
 空间复杂度：O(1)
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
    }
}

let test = Solution()

