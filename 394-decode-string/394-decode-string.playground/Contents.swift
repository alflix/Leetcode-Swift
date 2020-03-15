class Solution {
    func decodeString(_ s: String) -> String {
        var stack: [(Int, String)] = []
        var mutli: Int = 0
        var res: String = ""
        for c in Array(s) {
            switch c {
            case "[":
                stack.append((mutli, res))
                mutli = 0
                res = ""
            case "]":
                if let pop = stack.popLast() {
                    res = pop.1 + String(repeating: res, count: pop.0)
                }
            case "0"..."9":
                mutli = mutli * 10 + Int(String(c))!
            //"a"..."z"
            default:
                res += String(c)
            }
        }
        return res
    }
}

let s = Solution()
let res = s.decodeString("100[leetcode]")
