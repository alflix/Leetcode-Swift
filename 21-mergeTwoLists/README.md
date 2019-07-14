### [21. 合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists/submissions/)

#### 题目

将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

示例：
输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4

#### 思路

为了合并 l1, l2, 我们需要对 l1.0 和 l2.0 进行比较，因此我们首先写出这样的代码：

```
 if l1.val < l2.val {
    case 0
 } else {
    case 1
 }
```

case 0 , 我们需要对 l1.next 和 l2 再次进行比较，因此，需要用到递归。所以 case 1 可以写为：

```
 l1.next = mergeTwoLists(l1.next, l2)
```

由此可见，case 1 可以写为：

```
 l2.next = mergeTwoLists(l1, l2.next)
```

退出条件是 其中一个链表为空

#### 复杂度

时间复杂度：O(n+m)

空间复杂度：O(n+m)

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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }

    func test() {
        let l1 = ListNode(1)
        l1.append(value: 2)
        l1.append(value: 4)

        let l2 = ListNode(1)
        l2.append(value: 3)
        l2.append(value: 4)

        if let l3 = mergeTwoLists(l1, l2) {
            print(l3)
        }
    }
}

let solution = Solution()
solution.test()
```

