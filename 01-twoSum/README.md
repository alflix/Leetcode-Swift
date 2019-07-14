### [01: 两数之和](https://leetcode-cn.com/problems/two-sum/solution/)

#### 题目

给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。
你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。示例:
给定 nums = [2, 7, 11, 15], target = 9
因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]

#### 思路

由于是要找下标，所以想到的第一个思路就是通过哈希表来实现，value 就是我们要找的 index，所以 key 就只剩下 num

var dic = [num: value]

我们剩下的目标是，在 dic.keys 中找到其中相加为 target 的两个 num，所以我们遍历 keys，想象我们第一个要找的数是 target - num，如果在 dic 存在 value 的话，代表其被找到了， value 就是我们要找的 index

最后，再进一步优化就是，在最开始组装 dic 的时候就开始查找，不需要多余的遍历 keys

#### 复杂度

时间复杂度: O(n)

空间复杂度: O(n)

#### 解法

```swift
class Solution {    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dic[target - num] {
                return [lastIndex, i]
            }
            dic[num] = i
            print(dic)
        }
        fatalError("No valid outputs")
    }
}

let solution = Solution()
print(solution.twoSum([2, 7, 11, 15], 9))
```