### [100. 对称二叉树](https://leetcode-cn.com/problems/symmetric-tree/)

给定一个二叉树，检查它是否是镜像对称的。
 
例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

   1
  / \
 2   2
 / \ / \
3  4 4  3
 
但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
 
  1
 / \
2   2
 \   \
  3   3
 
思路：递归。
将问题转化为：两个树在什么情况下互为镜像？

如果同时满足下面的条件，两个树互为镜像： 
它们的两个根结点具有相同的值。
每个树的右子树都与另一个树的左子树镜像对称。

时间复杂度：O(n)
空间复杂度：O(log(n))

```swift
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
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
}

let test = Solution()
var p = TreeNode(1)

p.left = TreeNode(2)
p.left?.left = TreeNode(3)
p.left?.right = TreeNode(4)

p.right = TreeNode(2)
p.right?.left = TreeNode(4)
p.right?.right = TreeNode(3)

print(test.isSymmetric(p))
```

