### [反转链表](https://leetcode-cn.com/problems/reverse-linked-list/)

#### 题目

反转一个单链表。

示例:

输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL

#### 思路

迭代法。
从最左依次设置2个指针，交换节点方向，完成之后往右前进这2个指针

#### 复杂度

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