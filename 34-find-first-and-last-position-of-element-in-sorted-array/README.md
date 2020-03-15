### [34. 在排序数组中查找元素的第一个和最后一个位置](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

#### 题目

给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

你的算法时间复杂度必须是 O(log n) 级别。

如果数组中不存在目标值，返回 [-1, -1]。

示例 1:

输入: nums = [5,7,7,8,8,10], target = 8
输出: [3,4]
示例 2:

输入: nums = [5,7,7,8,8,10], target = 6
输出: [-1,-1]

#### 思路

二分查找，分别需要查找最左边的数和最右边的数。
注意二分查找尽量把判断条件写齐，然后思考收缩左侧边界还是收缩右侧边界。
最后返回的时候需要处理好边界条件。

#### 复杂度

时间复杂度：O(log2n)

空间复杂度：O(1)

#### 解法

```swift
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty {
            return [-1, -1]
        }
        let start = searchStartIndex(nums, target)
        let end = searchEndIndex(nums, target)
        return [start, end]
    }

    func searchStartIndex(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (right - left)/2 + left
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
            // 别返回，收缩左侧边界
            else if nums[mid] == target  {
                right = mid - 1
            }
        }
        if left >= nums.count || nums[left] != target {
            return -1
        }
        return left
    }

    func searchEndIndex(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (right - left)/2 + left
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
            // 别返回，收缩右侧边界
            else if nums[mid] == target  {
                left = mid + 1
            }
        }
        if right < 0 || nums[right] != target {
            return -1
        }
        return right
    }
}
```
