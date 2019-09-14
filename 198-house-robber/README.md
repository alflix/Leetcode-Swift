### [198. 打家劫舍](https://leetcode-cn.com/problems/house-robber/)

#### 题目

你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。

示例 1:
输入: [1,2,3,1]
输出: 4
解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。

示例 2:
输入: [2,7,9,3,1]
输出: 12
解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12 。

#### 思路

将所有元素反转。然后反转前 k 个元素，再反转后面 n-k 个元素，就能得到想要的结果。注意边界条件

假设 n=7 且 k=3 。

原始数组                  : 1 2 3 4 5 6 7
反转所有数字后             : 7 6 5 4 3 2 1
反转前 k 个数字后          : 5 6 7 4 3 2 1
反转后 n-k 个数字后        : 5 6 7 1 2 3 4 --> 结果

#### 复杂度

时间复杂度：O(n)
空间复杂度：O(1)

#### 解法

```swift
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        nums.reverse()
        reverse(&nums, start: 0, end: k-1)
        reverse(&nums, start: k, end: nums.count-1)
    }

    func reverse(_ nums: inout [Int], start: Int, end: Int) {
        guard end >= start, nums.count-1 > start, nums.count > end else { return }
        nums[start...end].reverse()
        print(nums)
    }
}
```

也可以自己实现 reverse （）
```swift
private func _reverse(_ nums: inout [Int], _ startIdx: Int, _ endIdx: Int) {
    // edge case
    if startIdx < 0 || endIdx > nums.count || startIdx >= endIdx {
        return
    }

    var startIdx = startIdx
    var endIdx = endIdx

    while startIdx < endIdx {
        _swap(&nums, startIdx, endIdx)
        startIdx += 1
        endIdx -= 1
    }
}

private func _swap<T>(_ nums: inout Array<T>, _ p: Int, _ q: Int) {
    (nums[p], nums[q]) = (nums[q], nums[p])
}
```