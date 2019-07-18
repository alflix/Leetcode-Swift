### [136. 只出现一次的数字](https://leetcode-cn.com/problems/single-number/)

#### 题目

给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

说明： 
你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

示例 1: 
输入: [2,2,1]
输出: 1

示例 2: 
输入: [4,1,2,1,2]
输出: 4

#### 思路

使用哈希表可以解决问题，但不符合「不使用额外空间」的要求，因为空间复杂度：O(n)

这道题目最精巧的解法是使用异或：

主要是利用其原理：XOR 满足交换律和结合律
 
```
a^b^a = (a^a)^b = 0^b
``` 

所以我们只需要将所有的数进行 ^ 操作，就能得到那个唯一的数字。
 
#### 复杂度

时间复杂度：O(n)

空间复杂度：O(1)

#### 解法

```swift
class Solution {            
    func singleNumber(_ nums: [Int]) -> Int {
        var first = nums.first!
        guard nums.count > 1 else {
            return first
        }
        var index = 1
        while index < nums.count {
            first = first ^ nums[index]
            index += 1
        }
        return first
    }
}

let test = Solution()
print(test.singleNumber([2,1,2,3,3]))
```