/*
给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

你的算法时间复杂度必须是 O(log n) 级别。

如果数组中不存在目标值，返回 [-1, -1]。

示例 1:

输入: nums = [5,7,7,8,8,10], target = 8
输出: [3,4]
示例 2:

输入: nums = [5,7,7,8,8,10], target = 6
输出: [-1,-1]

 */

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

let s = Solution()
//let l = s.searchRange([5,7,7,8,8,10], 8)
let l = s.searchRange([1], 1)
