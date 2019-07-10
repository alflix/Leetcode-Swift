### [107-二叉树的层次遍历 II](https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/solution/)

给定一个二叉树，返回其节点值自底向上的层次遍历。（即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
  3
 / \
 9  20
 /   \
 15   7
 返回其自底向上的层次遍历为：
 
 [
 [15,7],
 [9,20],
 [3]
 ]
 
 思路：递归
 
 递归的终止条件是：当前节点为空
 节点不为空时，判断二维数组的 count 是否等于节点的深度，是的话插入一个空的一维数组。
 然后把 val 插入到该一维数组中。（注意该一维数组在二维数组中的位置，不一定是第一位，因为后面会递归这个操作，当前节点还有相同深度的 val 没有插入）
 按照上面的讨论即可写出代码
 
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var list: [[Int]] = []
        levelOrderBottom(list: &list, root: root, depth: 0)
        return list
    }
    
    func levelOrderBottom(list: inout [[Int]], root: TreeNode?, depth: Int) {
        guard let root = root else { return }
        if list.count == depth {
            list.insert([], at: 0)
        }
        list[list.count - depth - 1].append(root.val)
        levelOrderBottom(list: &list, root: root.left, depth: depth + 1)
        levelOrderBottom(list: &list, root: root.right, depth: depth + 1)
    }
}

let test = Solution()
var p = TreeNode(3)
p.left = TreeNode(9)
p.right = TreeNode(20)
p.right?.left = TreeNode(15)
p.right?.right = TreeNode(7)

print(test.levelOrderBottom(p))

var q = TreeNode(1)
q.left = TreeNode(2)
q.left?.left = TreeNode(3)
q.left?.right = TreeNode(4)
q.right = TreeNode(5)

print(test.levelOrderBottom(q))
```

