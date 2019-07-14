### [83. 删除排序链表中的重复元素](https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/)

#### 题目

给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

示例 1:

```
输入: 1->1->2
输出: 1->2
```

示例 2:

```
输入: 1->1->2->3->3
输出: 1->2->3
```

#### 思路

解这道题，关键是要理解好链表的概念。
利用一个头结点 cur，和下一个结点判断，如果相等，则头结点的 next 等于 next.next（此时 head 的 next 已同样指向 next.next）
如果不想等，则将 cur 移动到下一个 head 上。

![IMG_6175](https://github.com/alflix/leetcode-swift/tree/master/83-deleteDuplicates/IMG_6175.JPG)

#### 复杂度

时间复杂度：O(n)
空间复杂度：O(1)

#### 解法

```swift
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var cur = head
        while cur.next != nil {
            if cur.next!.val == cur.val {
                cur.next = cur.next!.next
            } else {
                cur = cur.next!
            }
        }
        return head
    }
}

let test = Solution()
let l1 = ListNode(1)
l1.append(value: 1)
l1.append(value: 2)
l1.append(value: 3)
l1.append(value: 3)
// 3
print(test.deleteDuplicates(l1)!)
```