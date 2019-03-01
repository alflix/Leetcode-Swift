/**
 链接: https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 
 题目：给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 示例 2:
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 示例 3:
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 思路：这道题目的解法叫做“滑动窗口”
 首先，一次 for 循环是必须的。
 思路就是在这一次 for 循环顺便把无重复字符的最长子串的长度给拿出来
 看👇：> 就是每次循环的 index，如果发现出现了重复的字符，就把 < 往右挪，挪动的位置，取决于上一次重复的字符字符出现的位置（通过字典记录）。
 最后每次把 <> 的最长长度赋值到我们想要的变量即可。
 a b c a b a b b
 < >                2
 <   >              3
   <   >            3
     <   >          3
         < >        2
           < >      2
               <>   1
 
 时间复杂度：O(n)
 空间复杂度：O(n)
 */

class Solution {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var dic = [Character: Int]()
        var longest = 0
        var left = 0
        
        for (index, char) in s.enumerated() {
            if let tmp = dic[char], tmp >= left {
                left = tmp + 1
            }
            dic[char] = index
            longest = max(longest, index - left + 1)
        }
        return longest
    }
    
    func test() {
        print("\(lengthOfLongestSubstring("abcabcbb"))")
        print("\(lengthOfLongestSubstring("bbbbb"))")
        print("\(lengthOfLongestSubstring("pwwkew"))")
        print("\(lengthOfLongestSubstring("abba"))")
        print("\(lengthOfLongestSubstring(" "))")
    }
}

let solution = Solution()
solution.test()
