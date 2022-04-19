//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//1. Factorial
func factorial(_ num: Int) -> Int {
    if num <= 1 { return 1 }
    return num * factorial(num - 1)
}

print(factorial(5))

//2. Fibonacci
func fibonacci( sum: Int, prevSum: Int, currentTerm: Int, endTerm: Int) {
    print(sum)
    if (currentTerm <= endTerm) {
        var newSum = 0
        if sum == 0 {
            newSum = sum + 1
        } else {
            newSum = sum + prevSum
        }
        fibonacci(sum: newSum, prevSum: sum, currentTerm: currentTerm + 1, endTerm: endTerm)
    }
}

fibonacci(sum: 0,prevSum: 0,currentTerm:1, endTerm: 8)

//abc cba
//ab,cd
//3. Reverse String
func reverseStr(string: String) -> String {
    var charArray = Array(string) //Convert String to Char Array
    let size = charArray.count - 1
    let mid = size / 2
    //to - Open boundary
    //through - Closed boundary we use this
    for index in stride(from: 0, through: mid, by: 1) {
        let temp = charArray[index]
        charArray[index] = charArray[size - index]
        charArray[size - index] = temp
    }
    return String(charArray)
}

print("Reverse abc = \(reverseStr(string:"Reverse abc"))")
print("Reverse abcd = \(reverseStr(string:"abcd"))")

//4. isUniqueCharacter
func isUnique1(str: String) -> Bool {
    let charArray = Array(str)
    var trackArray = [Bool].init(repeating: false, count: 128)
    for (_ , value) in charArray.enumerated() {
        //get the character value
        guard let ascii = value.asciiValue else {
            continue
        }
        let isPresent = trackArray[Int(ascii)]
        if isPresent {
            return false
        } else {
            trackArray[Int(ascii)] = true
        }
    }
    return true
}
print(isUnique1(str:"1233"))

//5. isUnique Another Approach
func isUnique2(str: String) -> Bool {
    let charArray = Array(str)
    var dict: Dictionary<Character,Int> = [:]
    for char in charArray {
        var value = dict[char, default: 0]
        value += 1
        dict[char] = value
        if value > 1 {
            return false
        }
    }
    
    return true
}
print(isUnique1(str:"123"))

class Node {
    let value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class Tree {
    
    var root: Node
    
    init (value: Int) {
        self.root = Node(value: value)
    }
    
    func addNode(_ value: Int,_ node: Node) {
        if value < node.value  {
            if let left = node.left {
                addNode(value, left)
            } else {
                let newNode = Node(value: value)
                node.left = newNode
            }
            
        } else if value > node.value  {
            if let right = node.right {
                addNode(value, right)
            } else {
                let newNode = Node(value: value)
                node.right = newNode
            }
        }
    }
    
    func findMin(_ node: Node) -> Node {
        if let left = node.left {
            return findMin(left)
        }
        return node
    }
    
    func inOrder(_ node: Node?) {
        //L, C, R
        guard let current = node else {
            return
        }
        inOrder(current.left)
        print(current.value)
        inOrder(current.right)
    }
    
    func preOrder(_ node: Node?) {
        
        //C, L, R
        guard let current = node else {
            return
        }
        print(current.value)
        preOrder(current.left)
        preOrder(current.right)
    }
    
    func postOrder(_ node: Node?) {
        guard let current = node else {
            return
        }
        //L R C
        postOrder(current.left)
        postOrder(current.right)
        print(current.value)
    }
}

func isPermutationString(_ str1: String, _ str2: String) -> Bool {
    let sorted1 = str1.sorted()
    let sorted2 = str2.sorted()
    if sorted1 == sorted2 {
        return true
    }
    return false
}

func removeDuplicate(_ str: String) -> String {
    let unique = Set(str)
    return String(unique)
}

func isPalindrom(_ str: String) -> Bool {
    let revStr = str.reversed()
    return String(revStr) == str
}

func compressString(_ str: String) -> String {
    let charArray = String(str)
    var strMap: Dictionary<Character, Int> = [:]
    for char in charArray {
        let val = strMap[char, default:0]
        strMap[char] = val + 1
    }
    var retval = ""
    for key in strMap.keys {
        retval += "\(key)\(strMap[key, default:0])"
    }
    
    return retval
}

print(compressString("aabb"))

"".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)



