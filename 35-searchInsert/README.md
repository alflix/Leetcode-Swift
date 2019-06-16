### [35. 搜索插入位置](https://leetcode-cn.com/problems/search-insert-position/)

给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

 你可以假设数组中无重复元素。

 示例 1:
 输入: [1,3,5,6], 5
 输出: 2

 示例 2:
 输入: [1,3,5,6], 2
 输出: 1

 示例 3:
 输入: [1,3,5,6], 7
 输出: 4

 示例 4:
 输入: [1,3,5,6], 0
 输出: 0

 思路：非常简单，二分查找
 
 时间复杂度：O(logn)
 空间复杂度：O(1)

```swift
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
}
```

