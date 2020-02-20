### [217. 存在重复元素](https://leetcode-cn.com/problems/contains-duplicate/)

#### 题目

给定一个整数数组，判断是否存在重复元素。

如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。

示例 1:
输入: [1,2,3,1]
输出: true

示例 2:
输入: [1,2,3,4]
输出: false

示例 3:
输入: [1,1,1,3,3,4,3,2,4,2]
输出: true

#### 思路

通过数组创建一个 Set，之后再和数组比对其 count，不相等即存在重复元素

#### 复杂度

时间复杂度: O(1)
空间复杂度: O(n)

#### 解法

```swift
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let set = Set(nums)
        return set.count != nums.count
    }
}
```