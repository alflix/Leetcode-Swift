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
 2            2
 
 [1,2],     [1,null,2]
 输出: false
 
 示例 3:
 输入:
  1         1
 / \       / \
 2  1     1   2
 
 [1,2,1],   [1,1,2]
 输出: false
 
 思路：递归。检查p和q节点是否不是空，它们的值是否相等。如果所有检查都正常，则递归地为子节点执行相同操作
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil { return true }
        guard let p = p, let q = q else { return false }
        guard p.val == q.val else { return false }        
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}

let test = Solution()
var p = TreeNode(1)
p.left = TreeNode(2)
p.right = TreeNode(1)

var q = TreeNode(1)
q.left = TreeNode(1)
q.right = TreeNode(2)

print(test.isSameTree(p, q))


