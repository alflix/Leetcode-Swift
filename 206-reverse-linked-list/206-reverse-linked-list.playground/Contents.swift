/**
链接: https://leetcode-cn.com/problems/reverse-linked-list/

反转一个单链表。

示例:

输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL

思路：迭代法。
从最左依次设置2个指针，交换节点方向，完成之后往右前进这2个指针

时间复杂度: O(n)
空间复杂度: O(1)
*/

class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
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

let l1 = ListNode(1)
l1.append(value: 2)
l1.append(value: 3)
l1.append(value: 4)
l1.append(value: 5)

let solution = Solution()
solution.reverseList(l1)

