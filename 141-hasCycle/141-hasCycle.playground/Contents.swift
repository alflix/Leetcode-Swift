/**
 给定一个链表，判断链表中是否有环。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 
 示例 1：
 
 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。    
 
 示例 2：
 
 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。
 
 示例 3：
 
 输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。

 方法：可以转化为一个追击问题
 前后双指针，slow走一步，fast走两步，如果有环存在，一定会相遇的

 时间复杂度：O(n)
 空间复杂度：O(1)

 */

class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    func append(value: Int)  {
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
    func hasCycle(_ head: ListNode?) -> Bool {
        if (head == nil || head?.next == nil) {
            return false          
        }
        var slow = head
        var fast = head?.next
        while(slow?.val != fast?.val) {
            if (fast ==  nil || fast.next == nil) {
                return false        
            }
            slow = slow?.next
            fast = fast.next.next
        }
        return true
    }
}

let solution = Solution()
let l1 = ListNode(1)
l1.append(value: 2)
l1.append(value: 4)
print(solution.hasCycle(l1))
