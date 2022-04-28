//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//[#, a, c, b] -> 2
//[a, c] -> 1
func getFinalString(_ s: String) -> String {
    var charArray: [Character] = []
    for (_, char) in s.enumerated() {
        if char == "#" {
            if (charArray.count) > 0 {
                let indexToBeRemoved = charArray.count - 1
                charArray.remove(at: indexToBeRemoved)
            }
        } else {
            charArray.append(char)
        }
    }
    print(charArray)
    return String(charArray)
}
print(getFinalString("ab##"))
//"ab##"
//"c#d#"
func backspaceCompare(_ s: String, _ t: String) -> Bool {
    let first = getFinalString(s)
    print(first)
    let second = getFinalString(t)
    print(second)
    return first == second
}

//backspaceCompare("#ab#d", "ac#d")

func backspaceCompareOpt(_ s: String, _ t: String) -> Bool {
    
    var count = s.count > t.count ? s.count : t.count
    var p1 = s.count > t.count ? s.count - 1 : t.count - 1
    var p2 =  s.count > t.count ? t.count - 1 : s.count - 1
    var jumpIndex1 = 0
    var jumpIndex2 = 0
    //var holdStr1 = 0
    //var holdStr2 = 0
    //var lastValStr1 = 0
    //var lastValStr2 = 0
    
    for index in stride(from: count-1, through: 0 , by: -1) {

            if p1 - jumpIndex1 < 0 { return false }
            if p2 - jumpIndex2 < 0 { return false }
            
            var upperBoudS1 = s.index(s.startIndex, offsetBy: p1 - jumpIndex1)
            var upperBoudS2 = t.index(t.startIndex, offsetBy: p2 - jumpIndex2)
            
            //print("Index - \(index) Value - \(s[upperBoudS1]) - \(t[upperBoudS1]) ")
            if s[upperBoudS1] == "#" && t[upperBoudS2] != "#" {
                print("Skip String1 for P1 At - \(p1 - jumpIndex1)")
                jumpIndex1 += 1
                //p1 -= 1
                //continue
            }
            
            if t[upperBoudS2] == "#" && s[upperBoudS1]  != "#" {
                //print("Skip String2 for P2 At - \(p2 - jumpIndex2)")
                jumpIndex2 += 1
                //p2 -= 1
                //continue
            }
            
            if s[upperBoudS1] == "#" && t[upperBoudS2] == "#" {
                print("Skip String1 P1 - \(p1 - jumpIndex1)")
                //print("Skip String2  P2 - \(p2 - jumpIndex2)")
                jumpIndex1 += 1
                jumpIndex2 += 1
                //p1 -= 1
                //p2 -= 1
                //continue
            }
            
            print("Value String1 - \(p1 - jumpIndex1) - \(s[upperBoudS1])")
            //print("Value String2 - \(p2 - jumpIndex2) - \(t[upperBoudS2])")
            
            //if s[upperBoudS1] != t[upperBoudS2] {
                //return false
            //}
            
            //if (p1 - jumpIndex1 == 0) && (p2 - jumpIndex2 == 0) {
                //return true
            //}
            
            jumpIndex1 = 0
            jumpIndex2 = 0
            p1 -= 1
            p2 -= 1
        
        }
    
    return false
}


print(backspaceCompareOpt("accc###c", "ab#b#c"))
//
