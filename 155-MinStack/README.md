### [155. 最小栈](https://leetcode-cn.com/problems/min-stack/)

#### 题目

设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。
 
push(x) -- 将元素 x 推入栈中。
pop() -- 删除栈顶的元素。
top() -- 获取栈顶元素。
getMin() -- 检索栈中的最小元素。

示例:

```
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.getMin();   --> 返回 -2.
```

#### 思路

push，pop，top 这些用数组的基本操作即可，重点在于：需要在并能在常数时间内检索到最小元素的栈
最初的想法是通过一个 index 记录最小值的位置，并在 push 的时候更新 index。但这个想法在 pop 的时候走不通了。
其实可以用一个辅助的栈，与主栈同步 push 和 pop，唯一不同的是，辅助栈存的是主栈每个 index 之前所有值的最小值。
举例 主栈：[4,2,3,1] 辅助栈：[4, 2, 2, 1]）

#### 复杂度

时间复杂度：O(1)
空间复杂度：O(1)

#### 解法

```swift
class MinStack {
    private var array: [Int]
    private var assistArray: [Int]
    
    init() {
        array = []
        assistArray = []
    }
    
    func push(_ x: Int) {        
        if assistArray.isEmpty {
            assistArray.append(x)
        } else {
            if assistArray.last! <= x {
                assistArray.append(assistArray.last!)
            } else {
                assistArray.append(x)
            }
        }
        array.append(x)
    }
    
    func pop() {
        if array.isEmpty { return }
        assistArray.popLast()
        array.popLast()
    }
    
    func top() -> Int {        
        return array.last!
    }
    
    func getMin() -> Int {
        return assistArray.last!
    }
}


let obj = MinStack()
obj.push(1)
obj.push(2)
obj.push(3)
obj.push(4)
obj.pop()
let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()
```

