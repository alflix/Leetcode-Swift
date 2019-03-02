# LeetCode-Swift

### [01: 两数之和](https://leetcode-cn.com/problems/two-sum/solution/)

```
题目: 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。
你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。示例:
给定 nums = [2, 7, 11, 15], target = 9
因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
```

思路：由于是要找下标，所以想到的第一个思路就是通过哈希表来实现，value 就是我们要找的 index，所以 key 就只剩下 num
var dic = [num: value]
我们剩下的目标是，在 dic.keys 中找到其中相加为 target 的两个 num，所以我们遍历 keys，
想象我们第一个要找的数是 target - num，如果在 dic 存在 value 的话，代表其被找到了， value 就是我们要找的 index
最后，再进一步优化就是，在最开始组装 dic 的时候就开始查找，不需要多余的遍历 keys

时间复杂度: O(n)
空间复杂度: O(n)

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

### [02: 两数相加](https://leetcode-cn.com/problems/add-two-numbers/ )

```
题目：给出两个非空的链表用来表示两个非负的整数。其中，它们各自的位数是按照逆序的方式存储的，并且它们的每个节点只能存储一位数字。
如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例：
输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807

```

思路：用程序来模拟两数字相加的数学过程。首先，数字相加，所以要用一个 carry 表示两个相同位数数字相加后的数字，再对其除 10 进行取余运算，得到结果即为该位数的数字。
除后结果，作为进位数字赋值到下一位的操作初始值。以此类推。
用一个 while 循环执行这个操作，退出条件是两个链表为空，或 carry == 0
在 while 循环中，由于我们需要创建一个 newNode 作为在循环中一直变化的 node 存在，所以还需要创建一个哑节点 dummy，最为不变的头节点，
最后再使用 dummy->next 表示真正的头节点。

时间复杂度：O(max(m,n))，假设 m 和 n 分别表示 l1 和 l2 的长度，上面的算法最多重复 max(m,n) 次。
空间复杂度：O(max(m,n))， 新列表的长度最多为 max(m,n)+1。

```swift
class ListNode {    
    public var val: Int
    public var next: ListNode?    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    func append(value: Int)  {
        let node = ListNode(value)
        if let nextNode = next {
            nextNode.append(value: value)
        }else {
            next = node
        }
    }
}

extension ListNode: CustomStringConvertible {    
    public var description: String {
        var text = "["
        var node: ListNode? = self
        while node != nil {
            text += "\(node!.val)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

class Solution {    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1, l2 = l2, carry = 0
        let dummy = ListNode(0)
        var newNode = dummy
        
        while l1 != nil || l2 != nil || carry != 0 {
            if let node = l1 {
                carry += node.val
                l1 = node.next
            }
            if let node = l2 {
                carry += node.val
                l2 = node.next
            }
            newNode.next = ListNode(carry % 10)
            newNode = newNode.next!
            carry = carry / 10
        }
        return dummy
    }
    
    func test() {
        let l1 = ListNode(2)
        l1.append(value: 4)
        l1.append(value: 3)
        
        let l2 = ListNode(5)
        l2.append(value: 6)
        l2.append(value: 4)
        
        if let l3 = addTwoNumbers(l1, l2) {
            print(l3)
        }
    }
    
    func test2() {
        let l1 = ListNode(5)
        let l2 = ListNode(5)
        
        if let l3 = addTwoNumbers(l1, l2) {
            print(l3)
        }
    }
}

let solution = Solution()
solution.test()
solution.test2()
```

### [03: 无重复字符的最长子串](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/)

```
题目：给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
示例 1:
输入: "abcabcbb"
输出: 3
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

示例 2:
输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。

示例 3:
输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
```

思路：这道题目的解法叫做“滑动窗口”
首先，一次 for 循环是必须的。
思路就是在这一次 for 循环顺便把无重复字符的最长子串的长度给拿出来。
看👇：> 就是每次循环的 index，如果发现出现了重复的字符，就把 < 往右挪，挪动的位置，取决于上一次重复的字符字符出现的位置（通过字典记录）。
最后每次把 <> 的最长长度赋值到我们想要的变量即可。

```
 a b c a b a b b
 < >                2
 <   >              3
   <   >            3
     <   >          3
         < >        2
           < >      2
               <>   1
```

时间复杂度：O(n)
空间复杂度：O(n)

```swift
class Solution {    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var dic = [Character: Int]()
        var longest = 0
        var left = 0
        
        for (index, char) in s.enumerated() {
            if let tmp = dic[char], tmp >= left {
                left = tmp + 1
            }
            dic[char] = index
            longest = max(longest, index - left + 1)
        }
        return longest
    }
    
    func test() {
        print("\(lengthOfLongestSubstring("abcabcbb"))")
        print("\(lengthOfLongestSubstring("bbbbb"))")
        print("\(lengthOfLongestSubstring("pwwkew"))")
        print("\(lengthOfLongestSubstring("abba"))")
        print("\(lengthOfLongestSubstring(" "))")
    }
}

let solution = Solution()
solution.test()
```

### [4.寻找两个有序数组的中位数](https://leetcode-cn.com/problems/median-of-two-sorted-arrays/)

```
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
```

求两个有序数组的中位数，而且限制了时间复杂度为 O(log (m+n))，看到这个时间复杂度，自然而然的想到了应该使用二分查找法来求解。

那么回顾一下中位数的定义，如果某个有序数组长度是奇数，那么其中位数就是最中间那个，如果是偶数，那么就是最中间两个数字的平均值。这里对于两个有序数组也是一样的，假设两个有序数组的长度分别为m和n，由于两个数组长度之和 m+n 的奇偶不确定，因此需要分情况来讨论，对于奇数的情况，直接找到最中间的数即可，偶数的话需要求最中间两个数的平均值。为了简化代码，不分情况讨论，我们使用一个小 trick，我们分别找第 (m+n+1) / 2 个，和 (m+n+2) / 2 个，然后求其平均值即可，这对奇偶数均适用。加入 m+n 为奇数的话，那么其实 (m+n+1) / 2 和 (m+n+2) / 2 的值相等，相当于两个相同的数字相加再除以2，还是其本身。

这里我们需要定义一个函数来在两个有序数组中找到第K个元素，下面重点来看如何实现找到第 K 个元素。首先，为了避免产生新的数组从而增加时间复杂度，我们使用两个变量i和j分别来标记数组 nums1 和 nums2 的起始位置。然后来处理一些边界问题，比如当某一个数组的起始位置大于等于其数组长度时，说明其所有数字均已经被淘汰了，相当于一个空数组了，那么实际上就变成了在另一个数组中找数字，直接就可以找出来了。还有就是如果K=1 的话，那么我们只要比较 nums1 和 nums2 的起始位置i和j上的数字就可以了。

难点就在于一般的情况怎么处理？因为我们需要在两个有序数组中找到第K个元素，为了加快搜索的速度，我们要使用二分法，对K二分，意思是我们需要分别在nums1和nums2中查找第K/2个元素，注意这里由于两个数组的长度不定，所以有可能某个数组没有第K/2个数字，所以我们需要先检查一下，数组中到底存不存在第K/2个数字，如果存在就取出来，否则就赋值上一个整型最大值。如果某个数组没有第 K/2 个数字，那么我们就淘汰另一个数字的前 K/2 个数字即可。有没有可能两个数组都不存在第 K/2 个数字呢，这道题里是不可能的，因为我们的K不是任意给的，而是给的 m+n 的中间值，所以必定至少会有一个数组是存在第K/2个数字的。最后就是二分法的核心啦，比较这两个数组的第 K/2 小的数字 midVal1 和 midVal2 的大小，如果第一个数组的第 K/2 个数字小的话，那么说明我们要找的数字肯定不在 nums1 中的前K/2个数字，所以我们可以将其淘汰，将 nums1的起始位置向后移动K/2个，并且此时的K也自减去K/2，调用递归。反之，我们淘汰 nums2 中的前K/2个数字，并将 nums2 的起始位置向后移动K/2个，并且此时的K也自减去K/2，调用递归即可。

```swift
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
            return min(nums1[first1], nums2[first2])
        }
        let midVal1 = (first1 + index/2 - 1 < nums1.count) ? nums1[first1 + index/2 - 1] : Int.max
        let midVal2 = (first2 + index/2 - 1 < nums2.count) ? nums2[first2 + index/2 - 1] : Int.max
        if midVal1 < midVal2 {
            return findKth(nums1, first1 + index/2, nums2, first2, index - index/2)
        }else{
            return findKth(nums1, first1, nums2, first2 + index/2, index - index/2)
        }
    }
    
    func test() {
        print(findMedianSortedArrays([2, 3], [1, 5, 8]))
    }
}

let solution = Solution()
solution.test()
```

