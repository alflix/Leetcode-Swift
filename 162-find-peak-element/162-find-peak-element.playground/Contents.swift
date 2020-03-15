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

let s = Solution()
let r = s.findPeakElement([1,2,4,5,7,9,8,6,3])
