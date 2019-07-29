/**
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
 请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
 你可以假设 nums1 和 nums2 不会同时为空。
 
 示例 1:
 nums1 = [1, 3]
 nums2 = [2]
 则中位数是 2.0
 
 示例 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 则中位数是 (2 + 3)/2 = 2.5

 求两个有序数组的中位数，而且限制了时间复杂度为 O(log (m+n))，看到这个时间复杂度，自然而然的想到了应该使用二分查找法来求解。
 
 中位数的即，如果某个有序数组长度是奇数，那么其中位数就是最中间那个，如果是偶数，那么就是最中间两个数字的平均值。这里对于两个有序数组也是一样的，
 假设两个有序数组的长度分别为 m 和 n，由于两个数组长度之和 m+n 的奇偶不确定，因此需要分情况来讨论，对于奇数的情况，直接找到最中间的数即可，偶数的话需要求最中间两个数的平均值。
 
 为了简化代码，不分情况讨论，我们使用一个小 trick，我们分别找第 (m+n+1) / 2 个，和 (m+n+2) / 2 个，然后求其平均值即可，这对奇偶数均适用。
 加入 m+n 为奇数的话，那么其实 (m+n+1) / 2 和 (m+n+2) / 2 的值相等，相当于两个相同的数字相加再除以2，还是其本身。
 
 这里我们需要定义一个函数来在两个有序数组中找到第 K 个元素，下面重点来看如何实现找到第 K 个元素。首先，为了避免产生新的数组从而增加时间复杂度，
 我们使用两个变量 first1和 first2 分别来标记数组 nums1 和 nums2 的起始位置。然后来处理一些边界问题，比如当某一个数组的起始位置大于等于其数组长度时，
 说明其所有数字均已经被淘汰了，相当于一个空数组了，那么实际上就变成了在另一个数组中找数字，直接就可以找出来了。
 还有就是如果K=1 的话，那么我们只要比较 nums1 和 nums2 的起始位置的数字就可以了。
 
 难点就在于一般的情况怎么处理？因为我们需要在两个有序数组中找到第 K 个元素，为了加快搜索的速度，我们要使用二分法，对 K 二分，
 意思是我们需要分别在 nums1 和 nums2 中查找第 K/2 个元素，注意这里由于两个数组的长度不定，所以有可能某个数组没有第 K/2 个数字，
 所以我们需要先检查一下，数组中到底存不存在第K/2个数字，如果存在就取出来，否则就赋值上一个整型最大值。如果某个数组没有第 K/2 个数字，
 那么我们就淘汰另一个数字的前 K/2 个数字即可。有没有可能两个数组都不存在第 K/2 个数字呢，这道题里是不可能的，
 因为我们的K不是任意给的，而是给的 m+n 的中间值，所以必定至少会有一个数组是存在第K/2个数字的。
 
 最后就是二分法的核心啦，比较这两个数组的第 K/2 小的数字 midVal1 和 midVal2 的大小，如果第一个数组的第 K/2 个数字小的话，
 那么说明我们要找的数字肯定不在 nums1 中的前K/2个数字，所以我们可以将其淘汰，将 nums1的起始位置向后移动K/2个，
 并且此时的K也自减去K/2，调用递归。反之，我们淘汰 nums2 中的前K/2个数字，并将 nums2 的起始位置向后移动K/2个，
 并且此时的K也自减去K/2，调用递归即可。
 
 */

class Solution {    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        let left = (m + n + 1) / 2
        let right = (m + n + 2) / 2
        return Double(findKth(nums1, 0, nums2, 0, left) + findKth(nums1, 0, nums2, 0, right)) / 2.0
    }
    
    /// 在两个有序数组中找到第K个元素
    ///
    /// - Parameters:
    ///   - nums1: 第1个有序数组
    ///   - first1:第1个有序数组的起始位置
    ///   - nums2: 第2个有序数组
    ///   - first2: 第2个有序数组的起始位置
    ///   - index: 第 K 个
    /// - Returns: 元素
    func findKth(_ nums1: [Int], _ first1: Int, _ nums2: [Int], _ first2: Int, _ index: Int) -> Int {
        if first1 >= nums1.count {//nums1为空数组
            return nums2[first2 + index - 1]
        }
        if first2 >= nums2.count {//nums2为空数组
            return nums1[first1 + index - 1]
        }
        if index == 1 {
            print("其中一个数组只有一个元素了")
            return min(nums1[first1], nums2[first2])
        }
        let midVal1 = (first1 + index/2 - 1 < nums1.count) ? nums1[first1 + index/2 - 1] : Int.max
        let midVal2 = (first2 + index/2 - 1 < nums2.count) ? nums2[first2 + index/2 - 1] : Int.max
        
        if midVal1 < midVal2 {
            print("抛弃 midVal1 小的数字 \(midVal1), \(midVal2)")
            return findKth(nums1, first1 + index/2, nums2, first2, index - index/2)
        }else{
            print("抛弃 midVal2 小的数字 \(midVal1), \(midVal2)")
            return findKth(nums1, first1, nums2, first2 + index/2, index - index/2)
        }
    }
    
    func test() {
        print(findMedianSortedArrays([2, 3], [1, 5, 8]))
    }
}

let solution = Solution()
solution.test()
