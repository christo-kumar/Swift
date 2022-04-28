//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Approach - 1 comparing the reverse string
func isPalindrome1(_ s: String) -> Bool {
    
    if s.count <= 1 {
        return true
    }
    let regEx = try! NSRegularExpression(pattern: "[^A-Za-z0-9]", options: .caseInsensitive)
    let range = NSMakeRange(0, s.count)
    let truncated = regEx.stringByReplacingMatches(in: s, options: [], range: range, withTemplate: "").lowercased()
    let revTruncated = truncated.reversed()
    return truncated == String(revTruncated)
}

//Approach-2 Begin from middle move towards left and right end
func isPalindrome2(_ s: String) -> Bool {
    
    if s.count <= 1 {
        return true
    }
    let regEx = try! NSRegularExpression(pattern: "[^A-Za-z0-9]", options: .caseInsensitive)
    let range = NSMakeRange(0, s.count)
    let truncated = Array(regEx.stringByReplacingMatches(in: s, options: [], range: range, withTemplate: "").lowercased())
    var left = 0
    var right = 0
    let size = truncated.count
    
    left = size / 2
    right = size / 2
    if size % 2 == 0 {
        left -= 1
    }

    for _ in stride(from: size/2, to: 0, by: -1) {
        print("left - \(left) right -\(right)")
        if left >= 0 && right <= size - 1 {
            if truncated[right] != truncated[left] {
                return false
            }
            right += 1
            left  -= 1
        }
    }
    return true
}

//Begin from left and right and move towards the center
func isPalindrome3(_ s: String) -> Bool {
    
    if s.count <= 1 {
        return true
    }
    let regEx = try! NSRegularExpression(pattern: "[^A-Za-z0-9]", options: .caseInsensitive)
    let range = NSMakeRange(0, s.count)
    let truncated = Array(regEx.stringByReplacingMatches(in: s, options: [], range: range, withTemplate: "").lowercased())
    let size = truncated.count
    var left = 0
    var right = size - 1
    
    while (right > left) {
        if (truncated[left] != truncated[right]) {
            return false
        }
        left  += 1
        right -= 1
    }
    return true
}

//print(isPalindrome3("abca"))
func truncateFromLeft() -> String{
    return ""
}

func trucateFromRight() -> String {
    return ""
}

func isPalindromeOneAway(_ s: String) -> Bool {
    
    if s.count <= 1 {
        return true
    }
    let regEx = try! NSRegularExpression(pattern: "[^A-Za-z0-9]", options: .caseInsensitive)
    let range = NSMakeRange(0, s.count)
    var truncated = Array(regEx.stringByReplacingMatches(in: s, options: [], range: range, withTemplate: "").lowercased())
    let size = truncated.count
    var left = 0
    var right = size - 1
    var isEditApplied = false
    
    while (right > left) {
        print("==== left - \(left) Right - \(right) ====")
        if (truncated[left] != truncated[right]) {
            print("first Difference \(left) - \(right)")
            if !isEditApplied {
                isEditApplied = true
                let leftchar = truncated.remove(at: left)
                right = right - 1
                print("After deleting - \(leftchar) at \(left) - \(truncated[left]) - \(truncated[right]) ")
                //substring from left to right
                var newStr = String(truncated[left...right])
                var revNewStr = String(newStr.reversed())
                if newStr == revNewStr {
                    return true
                } else {
                    truncated.insert(leftchar, at: left)
                    right = right + 1
                    truncated.remove(at: right)
                    right = right - 1
                    newStr = String(truncated[left...right])
                    revNewStr = String(newStr.reversed())
                    if newStr == revNewStr {
                        return true
                    } else {
                        return false
                    }
                }
            }
        }
        right -= 1
        left += 1
    }
    return true
}



print(isPalindromeOneAway("abefa"))
