### [46. 全排列](https://leetcode-cn.com/problems/permutations/)

#### 题目

给定一个没有重复数字的序列，返回其所有可能的全排列。

示例:

输入: [1,2,3]
输出:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]

#### 思路

这是一道经典的深度优先遍历的题目。
回溯法的核心是对树节点调用处理方法，然后使用递归调用下一个树节点，处理完左节点.
假设到头了，那需要使用回溯回到上一个节点，此时关键的步骤是把所有判断状态恢复为处理完左节点之前的状态。

#### 复杂度

时间复杂度：O(n!)

空间复杂度：O(n)

#### 解法

```swift
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var path = [Int]()
        var isVisited = [Bool](repeating: false, count: nums.count)

        dfs(&res, &path, &isVisited, nums)

        return res
    }

    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ isVisited: inout [Bool], _ nums: [Int]) {
        // 终止条件
        if path.count == nums.count {
            res.append(path)
            return
        }

        for (i, num) in nums.enumerated() where !isVisited[i] {
            // 处理逻辑
            path.append(num)
            isVisited[i] = true
            // 递归
            dfs(&res, &path, &isVisited, nums)
            // 恢复回到上一个节点时的状态，此时上一个 num 需要被移除掉，且当前的 visited 状态为false
            isVisited[i] = false
            path.removeLast()
        }
    }
}

let s = Solution()
let r = s.permute([1,2,3])
```