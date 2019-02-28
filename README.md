# LeetCode-Swift

#### 01: 两数之和

链接: https://leetcode-cn.com/problems/two-sum/solution/

```
题目: 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
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

时间复杂度: O(n), 

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

#### 02: 两数相加

链接: https://leetcode-cn.com/problems/add-two-numbers/ 

```
题目：给出两个非空的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

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

