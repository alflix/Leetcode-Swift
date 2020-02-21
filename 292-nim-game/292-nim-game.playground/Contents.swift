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

时间复杂度: O(n)
空间复杂度: O(n)
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

let l1 = ListNode(1)
l1.append(value: 2)
l1.append(value: 2)
l1.append(value: 1)
let s = Solution()
s.isPalindrome(l1)
