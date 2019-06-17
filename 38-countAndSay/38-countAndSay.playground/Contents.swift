/**
 报数序列是一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 
 1 被读作  "one 1"  ("一个一") , 即 11。
 11 被读作 "two 1s" ("两个一"）, 即 21。
 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
 
 给定一个正整数 n（1 ≤ n ≤ 30），输出报数序列的第 n 项。 
 注意：整数顺序将表示为一个字符串。
 
 示例 1:
 输入: 1
 输出: "1"
 
 示例 2: 
 输入: 4
 输出: "1211"
 
 思路：从题目开始思考，想求 2 的值，需要知道 1 的值，想求 3 的值，需要知道 2 的值，因此需要用到递归。
 因此，我们只要思考 2 的求法即可。（再往后面的值递归前面的即可）
 2，上一个值是 1，读“一个一”，也就是我们需要循环 “1”，然后“读出来”
 为了“读出来”，我们需要用多一个循环（index），来计算有多少个连续的数字（count），即循环条件：相等
 计算完成之后，将上一个循环的 index 往后挪到当前循环的指针位置（读完这个数字了）
 
 时间复杂度：O(n*m)
 空间复杂度：O(n)
 */

class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        let str = countAndSay(n-1)
        let strChars = Array(str)
        var result = ""
        var index = 0
        var i = 0
        while index < strChars.count {
            let value = strChars[index]
            var count = 0
            while i < strChars.count, value == strChars[i] {
                i += 1
                count += 1
            }
            result += "\(count)" + String(value) 
            index = i
        }
        return result
    }
}

let test = Solution()
print(test.countAndSay(5)) 
