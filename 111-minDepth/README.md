### [111. 二叉树的最小深度](https://leetcode-cn.com/problems/minimum-depth-of-binary-tree/)

#### 题目

给定一个二叉树，找出其最小深度。
 
最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

说明: 叶子节点是指没有子节点的节点。

示例:

给定二叉树 [3,9,20,null,null,15,7],

```
  3
 / \
9  20
  /  \
 15   7
```

返回它的最小深度  2.。

#### 思路

递归。(和二叉树相关的问题大部分可以用递归解决)

递归的终止条件是：

 - 当前节点为空（返回0）

 - 当前节点没有左子树和右子树（返回1）

否则：

 - 如果有左子树，则左子树加入比较

 - 如果有左子树，则左子树加入比较

返回比较值+1

#### 复杂度

时间复杂度：O(n)

空间复杂度：O(log(n))

#### 解法

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
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        if root?.left == nil && root?.right == nil { return 1 }
        var a = Int.max        
        if let left = root?.left {
            a = min(a, minDepth(left))
        }
        if let right = root?.right {
            a = min(a, minDepth(right))
        }
        return a + 1                
    }
}

let test = Solution()
var p = TreeNode(0)
p.left = TreeNode(9)
p.right = TreeNode(20)
p.right?.left = TreeNode(15)
p.right?.right = TreeNode(7)

print(test.minDepth(p))
```

