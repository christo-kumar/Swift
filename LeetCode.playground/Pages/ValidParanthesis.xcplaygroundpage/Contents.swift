import UIKit

var greeting = "Hell"
let startRange = greeting.index(greeting.startIndex, offsetBy: 2)
let endRange = greeting.index(greeting.endIndex, offsetBy: -2)
let mySubstring = greeting[..<startRange]
let end = greeting[endRange...]
print(mySubstring)
print(end)

//1.Validate pattern //[{}

func validatePatter1(pattern: String) -> Bool {
    if pattern.count % 2 == 0 {
        let mid = pattern.count / 2
        let firstIndex = pattern.index(pattern.startIndex, offsetBy: mid)
        let secondIndex = pattern.index(greeting.endIndex, offsetBy: -mid)
        let firstSubString = Array(pattern[..<firstIndex])
        let secondSubString = pattern[secondIndex...]
        let reversed = Array(secondSubString.reversed())
        if firstSubString.count == reversed.count  {
            for (index,first) in firstSubString.enumerated() {
                let second = reversed[index]
                print("\(index) - \(first) - \(String(describing: first.asciiValue))")
                print("\(index) - \(second) - \(String(describing: second.asciiValue))")
                if let firstAscii = first.asciiValue, let secondAscii = second.asciiValue {
                    if Int(secondAscii) - Int(firstAscii) != 2 {
                        return false
                    }
                }
            }
            return true
        }
    }
    return false
}

//print(validatePatter1(pattern: "{}[]()"))

func patternMatch(_ s: String) -> Bool {
    let chacterMap: [Character: Character] = ["}":"{","]":"[",")":"("]
    let charArray = Array(s)
    var tempArray:[Character] = []
    for (_, char) in charArray.enumerated() {
        if char == "{" || char == "[" || char == "(" {
            //for opening add to array
            tempArray.append(char)
        } else if char == "}" || char == "]" || char == ")" {
            //for closing pop from array
            //and compare with relative char in map
            if tempArray.count > 0 {
                let temp = tempArray.removeLast()
                let mapValue = chacterMap[char]
                if temp != mapValue {
                    return false
                }
            } else {
                //return if first one is closing tag.
                return false
            }
        } else {
            //Anything apart from valid character should return false
            return false
        }
    }
    
    return tempArray.count == 0
}

//print(patternMatch("{[]}{}"))

func minToRemove(_ s: String) -> String {
    var charArray = Array(s)
    var tempArray: [Int] = []
    var index = 0
    while index < charArray.count {
        print("index - \(index) value - \(charArray[index]) count - \(charArray.count)")
        if charArray[index] == "(" {
            tempArray.append(index)
        } else if charArray[index] == ")" {
            if tempArray.count > 0 {
                tempArray.removeLast()
            } else {
                charArray.remove(at: index)
                index -= 1
            }
        }
        index += 1
    }

    for val in tempArray.reversed() {
        charArray.remove(at: val)
    }
    
    return String(charArray)
}

//a)b(c)d
print(minToRemove("))(("))


