### [用队列实现栈](https://leetcode-cn.com/problems/implement-stack-using-queues/)

#### 题目

使用队列实现栈的下列操作：

push(x) -- 元素 x 入栈
pop() -- 移除栈顶元素
top() -- 获取栈顶元素
empty() -- 返回栈是否为空
注意:

你只能使用队列的基本操作 -- 也就是 push to back, peek/pop from front, size, 和 is empty 这些操作是合法的。
你所使用的语言也许不支持队列。 你可以使用 list 或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
你可以假设所有操作都是有效的（例如, 对一个空的栈不会调用 pop 或者 top 操作）。

#### 思路

队列的实现参考：https://github.com/raywenderlich/swift-algorithm-club/tree/master/Queue
队列：FIFO（先进先出） 栈：LIFO(后进先出)
所以要先通过队列实现栈，肯定要有一个 pop 或者 push 的操作是 O(n), 另外一个是 0(1) (栈的「后进先出」也可以看成「先进后出」)。
我们可以让 push 操作是 0(1)，即 push 等于 队列的 enqueue，而 pop 的时候，需要维护另外一个 queue，让之前的 queue ，依次 dequeue 进去元素，直至最后一个，就是要 pop 的元素。

#### 复杂度

#### 解法

```swift
public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

class MyStack {
    /** Initialize your data structure here. */
    private var queue1 = Queue<Int>()
    var quene1Top: Int?
    
    init() {}
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue1.enqueue(x)
        quene1Top = x
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        var queue2 = Queue<Int>() 
        while queue1.count > 1 {
            quene1Top = queue1.dequeue()
            queue2.enqueue(quene1Top!)
        }
        let pop = queue1.dequeue()
        queue1 = queue2
        return pop!
    }
    
    /** Get the top element. */
    func top() -> Int {
        return quene1Top!
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue1.isEmpty
    }
}
// 1->2
let obj = MyStack()
obj.push(1)
obj.push(2)
let ret_2: Int = obj.pop()
let ret_3: Int = obj.pop()
let ret_4: Bool = obj.empty()
```