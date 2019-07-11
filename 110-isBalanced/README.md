### [110. 平衡二叉树](https://leetcode-cn.com/problems/balanced-binary-tree/)

给定一个二叉树，判断它是否是高度平衡的二叉树。 
本题中，一棵高度平衡二叉树定义为： 
一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。
 
示例 1: 
给定二叉树 [3,9,20,null,null,15,7]
 
  3
 / \
 9  20
   /  \
  15   7
返回 true 。
 
示例 2: 
给定二叉树 [1,2,2,3,3,null,null,4,4]
 
     1
    / \
   2   2
  / \
 3   3
/ \
4  4

返回 false 。
 

思路：递归。和 [104. 二叉树的最大深度](https://github.com/alflix/leetcode-swift/tree/master/104-maxDepth)
相似。在求深度的过程中，增加判断是否深度差大于1即可
 
时间复杂度：O(n)
空间复杂度：O(log(n))

```swift
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
    var isBalanced = true
    
    @discardableResult
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let left = maxDepth(root?.left)
        let right = maxDepth(root?.right)
        if abs(left - right) > 1 { isBalanced = false }
        return max(left, right) + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        maxDepth(root)
        return isBalanced
    }
}

let test = Solution()
var p = TreeNode(0)
p.left = TreeNode(9)
p.right = TreeNode(20)
p.right?.left = TreeNode(15)
p.right?.right = TreeNode(7)

var q = TreeNode(1)
q.left = TreeNode(2)
q.right = TreeNode(2)
q.left?.left = TreeNode(3)
q.left?.right = TreeNode(3)
q.left?.left?.left = TreeNode(4)
q.left?.left?.right = TreeNode(4)

print(test.isBalanced(p))
print(test.isBalanced(q))
```

