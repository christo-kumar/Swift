//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//Sliding Window Technique
func lengthOfLongestSubstring(_ s: String) -> Int {
    var charArray = Array(s)
    var charMap : Dictionary <Character, Int> = [:]
    var left = 0
    var right = 0
    var longest = 0
    
    for (index,_) in s.enumerated() {
        //Initialising Condition
        if right <= index {
            if (left == 0 && right == 0) {
                longest = 1
                charMap[charArray[right]] = 0
                right += 1
                continue
            }
            
            //check if char[right] is duplicate
            let prevIndex = charMap[charArray[right], default:-1]
            
            //print("Right - \(charArray[right]) Map - \(charMap[charArray[right]]) PrevIndex - \(prevIndex)")
            if prevIndex >= 0 {
                //print("I am here -1")
                if prevIndex >= left {
                    //print("I am here -2")
                    //print("\(charArray[right])")
                    charMap[charArray[right]] = right
                    left = prevIndex + 1
                    //print("I am here -3 - left \(left) right \(right) ")
                    if charArray[left] == charArray[right] {
                        left = right
                    }
                    //right += 1
                }
                if prevIndex < left {
                    //print("char - \(charArray[right])")
                    charMap[charArray[right]] = right
                    let current = (right - left) + 1
                    longest = current > longest ? current : longest
                    //right += 1
                }
                
            } else {
                //Add right to the map
                charMap[charArray[right]] = right
                //calculate and update the longest
                let current = (right - left) + 1
                longest = current > longest ? current : longest
                //right += 1
            }
        }
        right = right + 1
    }
   return longest
}

print(lengthOfLongestSubstring("abcabcbb"))
//"nfpdmpi"
