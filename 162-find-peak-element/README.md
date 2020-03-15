### [162. 寻找峰值](https://leetcode-cn.com/problems/find-peak-element/)

#### 题目

峰值元素是指其值大于左右相邻值的元素。

给定一个输入数组 nums，其中 nums[i] ≠ nums[i+1]，找到峰值元素并返回其索引。

数组可能包含多个峰值，在这种情况下，返回任何一个峰值所在位置即可。

你可以假设 nums[-1] = nums[n] = -∞。

示例 1:

输入: nums = [1,2,3,1]
输出: 2
解释: 3 是峰值元素，你的函数应该返回其索引 2。
示例 2:

输入: nums = [1,2,1,3,5,6,4]
输出: 1 或 5 
解释: 你的函数可以返回索引 1，其峰值元素为 2；
     或者返回索引 5， 其峰值元素为 6。

#### 思路

在有规律的数字数组中找一个值，优先考虑二分法（缩短遍历过程）
设置左右指针，如果其中间值大于中间值右边那个值，则峰值在左边区域。右指针指向中间值。
反之亦然。

#### 复杂度

时间复杂度：O(n)
空间复杂度：O(1)

#### 解法

```swift
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        var mid = 0
        while left < right {
            mid = (right - left)/2 + left
            if nums[mid] > nums[mid + 1] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
```