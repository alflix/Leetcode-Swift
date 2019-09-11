/**
给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

示例 1:

输入: [1,2,3,4,5,6,7] 和 k = 3
输出: [5,6,7,1,2,3,4]

解释:
向右旋转 1 步: [7,1,2,3,4,5,6]
向右旋转 2 步: [6,7,1,2,3,4,5]
向右旋转 3 步: [5,6,7,1,2,3,4]

示例 2:
输入: [-1,-100,3,99] 和 k = 2
输出: [3,99,-1,-100]
 
解释:
向右旋转 1 步: [99,-1,-100,3]
向右旋转 2 步: [3,99,-1,-100]

思路：将所有元素反转。然后反转前 k 个元素，再反转后面 n-k 个元素，就能得到想要的结果。

假设 n=7 且 k=3 。

原始数组                  : 1 2 3 4 5 6 7
反转所有数字后             : 7 6 5 4 3 2 1
反转前 k 个数字后          : 5 6 7 4 3 2 1
反转后 n-k 个数字后        : 5 6 7 1 2 3 4 --> 结果

时间复杂度：O(n)
空间复杂度：O(1)
 */

import Foundation

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

// 也可以自己实现 reverse （）
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
