### [108.平衡二叉树](https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree)

将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。 
 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

 示例: 
 给定有序数组: [-10,-3,0,5,9], 
 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树： 

        0
       / \
     -3   9
     /    /
    -10  5
     
 思路：递归

 想象数组是一段绳子（说明一格一格的），往中间剪，剪完，剩下就继续往中间剪，直到没办法剪了。
 即数组取中位数，构建节点，然后中位数左右两边继续这个操作。
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        return sortedArrayToBST(nums: nums, first: 0, last: nums.count - 1)
    }
    
    func sortedArrayToBST(nums: [Int], first: Int, last: Int) -> TreeNode? {
        if first > last { return nil }
        let mid = first + (last - first)/2
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST(nums: nums, first: first, last: mid - 1)
        node.right = sortedArrayToBST(nums: nums, first: mid + 1, last: last)
        return node
    }
}

let test = Solution()
var p = [-10,-3,0,5,9]
print(test.sortedArrayToBST(p)!)
```

