/**
 给定一个已按照升序排列的有序数组，找到两个数使得它们相加之和等于目标数。

 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。

 说明:

 返回的下标值（index1 和 index2）不是从零开始的。

 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。

 示例:

 输入: numbers = [2, 7, 11, 15], target = 9
 输出: [1,2]
 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
 
 思路：利用好「升序排列的有序数组」的特性，使用两个指针，初始分别位于第一个元素和最后一个元素位置，比较这两个元素之和与目标值的大小。

 如果和等于目标值，我们发现了这个唯一解。如果比目标值小，我们将较小元素指针增加一。如果比目标值大，我们将较大指针减小一。

 移动指针后重复上述比较知道找到答案

 时间复杂度：O(n)
 空间复杂度：O(1)
 */

import Foundation

class Solution {    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var index1 = 0
        var index2 = numbers.count - 1
        while index1 < index2 {
            let sum = numbers[index1] + numbers[index2]
            if sum == target {
                return [index1+1, index2+1]
            } else if sum < target {
                index1 += 1
            } else{
                index2 -= 1
            }
        }
        return []
    }
}

let solution = Solution()
solution.twoSum([2, 7, 11, 15], 9)
