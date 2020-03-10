### [912. 排序数组](https://leetcode-cn.com/problems/sort-an-array/)

#### 题目

给定一个整数数组 nums，将该数组升序排列。

示例 1：

输入：[5,2,3,1]
输出：[1,2,3,5]
示例 2：

输入：[5,1,1,2,0,0]
输出：[0,0,1,1,2,5]

#### 思路

快速排序

#### 复杂度

时间复杂度：O(nlogN),最差 O(n^2)   
数组全部有序时，此时为最坏情况，快速排序沦为冒泡排序，时间复杂度为O(n^2)

#### 解法

```swift
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        var tmp = nums
        quickSort(&tmp, left: 0, right: nums.count - 1)
        return tmp
    }

    func quickSort(_ nums: inout [Int], left: Int, right: Int) {
        guard left <= right else { return }
        let pivot = partition(&nums, left: left, right: right)
        quickSort(&nums, left: 0, right: pivot-1)
        quickSort(&nums, left: pivot+1, right: right)
    }

    func partition(_ nums: inout [Int], left: Int, right: Int) -> Int {
        var left = left
        var right = right
        let pivot = nums[left]

        while left < right {
            while left < right, nums[right] >= pivot {
                right -= 1
            }
            nums[left] = nums[right]

            while left < right, nums[left] < pivot {
                left += 1
            }
            nums[right] = nums[left]
        }
        nums[left] = pivot
        return left
    }
}

let test = Solution()
let result = test.sortArray([5,1,1,2,0,0])
```