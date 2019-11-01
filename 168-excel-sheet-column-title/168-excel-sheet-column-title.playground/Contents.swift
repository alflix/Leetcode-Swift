/**
给定一个正整数，返回它在 Excel 表中相对应的列名称。

例如，

1 -> A
2 -> B
3 -> C
...
26 -> Z
27 -> AA
28 -> AB 
...
示例 1:

输入: 1
输出: "A"
示例 2:

输入: 28
输出: "AB"
示例 3:

输入: 701
输出: "ZY"
 
思路：10进制转26进制
 
正常情况下我们每次取余数拼接后逆序一下即可

但由于我们多加了一个'#'字符，26 的返回结果是 A#, 52 的返回结果是 B#

来看 26 这个结果 'A#' 本质上是等价于 'Z' 的，

因此对于 count % 26 == 0 的情况，可以直接 + 'Z'，之后还需要 count = count/26 - 1，否则 26 的返回结果是 AZ
  
时间复杂度：O(n)
空间复杂度：O(1)
 */

import Foundation

class Solution {
    func convertToTitle(_ n: Int) -> String {
        let array = Array("#ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var count = n
        var res = ""
        while count > 0 {
            if count % 26 == 0 {
                res.append("Z")
                count = count/26 - 1
            } else {
                res.append(array[count%26])
                count /= 26
            }
        }
        return String(res.reversed())
    }
}
