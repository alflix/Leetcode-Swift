/**
链接: https://leetcode-cn.com/problems/palindrome-linked-list/

请判断一个链表是否为回文链表。

示例 1:

输入: 1->2
输出: false
示例 2:

输入: 1->2->2->1
输出: true


思路：
解法1. 对于空间复杂度O(n)的解法来讲，第一步，先把链表转换为数组，第二步，使用双指针法判断是否为回文

解法2.为了优化空间复杂度为O(1)，
 1.可以将链表的后半部分翻转，
 2再比较前部分和后部分，相同即为回文

第一步比较关键，为了找到前半部分的尾节点，可以使用快慢指针在一次遍历中找到：慢指针一次走一步，快指针一次走两步，快慢指针同时出发。
 当快指针移动到链表的末尾时，慢指针到链表的中间。
 通过慢指针将链表分为两部分。

1->2->3->4->5
1->2->3<-4<-5

1->2->3->4->5->6
1->2->3   4<-5<-6

时间复杂度: O(n)
空间复杂度: O(n)/O(1)
*/

/// ListNode
class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    func append(value: Int) {
        let node = ListNode(value)
        if let nextNode = next {
            nextNode.append(value: value)
        } else {
            next = node
        }
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var array: [Int] = []
        var node = head
        while node != nil {
            array.append(node!.val)
            node = node?.next
        }
        var first = 0
        var last = array.count - 1
        while first < last {
            if array[first] != array[last] {
                return false
            }
            first += 1
            last -= 1
        }
        return true
    }
}

class Solution2 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return true }
        let firstHalfEnd = self.endOfFirstHalf(head!)
        let secondHalfStart = self.reverseList(firstHalfEnd.next)

        var p1 = head
        var p2 = secondHalfStart
        var result = true
        while result && p2 != nil {
            if p1?.val != p2!.val {
                result = false
            }
            p1 = p1?.next
            p2 = p2?.next
        }

        return result
    }

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

    func endOfFirstHalf(_ head: ListNode) -> ListNode {
        var fast = head
        var slow = head
        while fast.next != nil && fast.next?.next != nil {
            fast = fast.next!.next!
            slow = slow.next!
        }
        return slow
    }
}

let l1 = ListNode(1)
let s = Solution2()
s.isPalindrome(l1)

