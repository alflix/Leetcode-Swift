### [78. 子集](https://leetcode-cn.com/problems/subsets/)

#### 题目

给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

说明：解集不能包含重复的子集。

 示例:
 输入: nums = [1,2,3]
 输出:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]

#### 思路

集合中每个元素的选和不选，构成了一个二叉状态树，比如，左子树是不选，右子树是选，从根节点、到叶子节点的所有路径，构成了所有子集。
因此，这道题可以看成是典型的回溯算法。(同46-permutation)

#### 复杂度

时间复杂度：O(n!)

空间复杂度：O(n)

#### 解法

```swift
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        dfs(res: &res, &path, nums: nums, index: 0)
        return res
    }

    private func dfs(res: inout [[Int]], _ path: inout [Int], nums: [Int], index: Int) {
        // 终止条件: 终止时，for 循环不会执行，所以不需要终止条件
        res.append(path)
        for i in index..<nums.count {
            // 1.处理逻辑
            path.append(nums[i])
            // 2.递归
            dfs(res: &res, &path, nums: nums, index: i + 1)
            // 3.恢复回到上一个节点时的状态
            path.removeLast()
        }
    }
}

let s = Solution()
let r = s.subsets([1, 2, 3])
```