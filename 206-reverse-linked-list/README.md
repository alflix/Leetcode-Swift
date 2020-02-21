### [回文链表](https://leetcode-cn.com/problems/palindrome-linked-list/)

#### 题目

请判断一个链表是否为回文链表。

示例 1:

输入: 1->2
输出: false
示例 2:

输入: 1->2->2->1
输出: true


#### 思路

解法1. 对于空间复杂度O(n)的解法来讲，第一步，先把链表转换为数组，第二步，使用双指针法判断是否为回文

解法2.为了优化空间复杂度为O(1)

-1.可以将链表的后半部分翻转，
-2再比较前部分和后部分，相同即为回文

第一步比较关键，为了找到前半部分的尾节点，可以使用快慢指针在一次遍历中找到：慢指针一次走一步，快指针一次走两步，快慢指针同时出发。
当快指针移动到链表的末尾时，慢指针到链表的中间。
通过慢指针将链表分为两部分。

#### 复杂度

时间复杂度: O(n)
空间复杂度: O(n)/O(1)

#### 解法
```swift
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head
        while cur != nil {
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
        }
        return pre
    }
}
```