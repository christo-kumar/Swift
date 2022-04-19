import UIKit
import Darwin

var greeting = "Hello, playground"

//Factorial
func factorial(number: Int) -> Int {
    if (number <= 1) {
        return 1
    }
    return number * factorial(number: number-1)
}

print(factorial(number: 5))

//Fibbonaci
func fibbonaci(_ sum: Int,_ prevSum: Int,_ term: Int,_ till: Int) -> Int {
    print(sum)
    if(term >= till) {
        return sum
    } else if (term == 1) {
        return fibbonaci(1, 0, term+1, till)
    }
    return fibbonaci(sum + prevSum, sum, term+1, till)
}

fibbonaci(0, 0, 1, 8)

//Reverse String
func reverseString(original: String)->String {
    var charArray = Array(original);
    let size = charArray.count - 1;
    let mid = size/2;
    for index in stride(from: 0, through: mid, by: 1) {
        let firstChar = charArray[index]
        let secondChar = charArray[size-index]
        charArray[index] = secondChar
        charArray[size-index] = firstChar
    }
    return String(charArray)
}
print(reverseString(original: "catap"))


//Algo to test if string contains unique character
func isUniqueCharacter(origalStr: String)-> Bool {
    var boolArray = [Bool].init(repeating: false, count: 128)
    let characArray = Array(origalStr)
    for (index, charac) in characArray.enumerated(){
        print("index is \(index)")
        guard let asciiVal = charac.asciiValue else {
            continue
        }
        let isPresent = boolArray[Int(asciiVal)]
        if (isPresent) {
            print("I am Also here")
            return false
        } else {
            print("I am here")
            boolArray[Int(asciiVal)] = true
        }
    }
    return true;
}

isUniqueCharacter(origalStr: "batt")

func isPermutationString(first: String, second: String)-> Bool {
    let firstSorted = String(first.sorted())
    let secondSorted = String(second.sorted())
    return firstSorted == secondSorted ? true : false
}

isPermutationString(first: "Bata", second: "Baat")

func urlifyString(original: String) -> String {
    
    return original.addingPercentEncoding(withAllowedCharacters:.urlHostAllowed) ?? ""
}

func urlifyString2(original: String) -> String {
    let strArray = original.components(separatedBy: .whitespaces)
    var retVal = ""
    for subStr in strArray {
        if(retVal.count > 0) {
            retVal = retVal + "%20" + subStr
        }
        else {
            retVal = subStr
        }
        
    }
    
    return retVal
}

print(urlifyString2(original: "Hello How Are you"))

//One or zero edits away
//Compressor also implemented here
func oneEditAway(first: String, second: String) -> Bool {
    var diff = 0
    let allowedDiff = 2
    if first.count == second.count {
        let firstArray = Array(first)
        let secondArray = Array(second)
        var firstMap: Dictionary<Character, Int> = Dictionary()
        var secondMap: Dictionary<Character, Int> = Dictionary()
        
        //Populate both maps
        for charac in firstArray {
            if let value = firstMap[charac] {
                firstMap[charac] = value + 1
            } else {
                firstMap[charac] = 1
            }
        }
        
        for charac in secondArray {
            if let value = secondMap[charac] {
                secondMap[charac] = value + 1
            } else {
                secondMap[charac] = 1
            }
            
        }
        
        print(firstMap)
        print(secondMap)
       
        for key in firstMap.keys {
            if firstMap[key] != secondMap[key] {
                diff = diff + 1
            }
        }
    }
    if diff > allowedDiff {
     return false
    }
    
    return true
}

oneEditAway(first: "abe", second: "aaf")

//Remove Duplicates
func removeDuplicate(original: String) -> String {
    let uniqueSet = Set(original)
    return String(uniqueSet)
}

//
func sumList() {
    let firstArray: [Int] = [6,2,8]
    let secondArray: [Int] = [5,9,6]
    var sumArray: [Int] = [0,0,0]
    var remainder = 0
    for index in stride(from: firstArray.count - 1, through: 0 , by: -1) {
        print(index)
        let num1 = firstArray[index]
        let num2 = secondArray[index]
        let sum = num1 + num2
        if index == 0 {
            sumArray[index] = sum + remainder
        } else {
            if (sum < 10) {
                sumArray[index] = sum + remainder
                remainder = 0
            } else {
                sumArray[index] = sum % 10 + remainder
                remainder = 1
            }
        }
    }
    
    print(sumArray)
}

sumList()

func compressString(_ thisStr: String)->String {
    let charArray = Array(thisStr)
    var charMap: Dictionary<Character,Int> = Dictionary<Character,Int>()
    for key in charArray {
        let countVal = charMap[key] ?? 0
        charMap[key] = countVal + 1
    }
    var retval = ""
    for key in charMap.keys {
        let count = charMap[key] ?? 0
        retval = retval + String.init(key) + "\(count)"
    }
    return retval
}

compressString("aaabbb")

func removeDuplicates(_ thisStr: String) -> String {
    let charSet = Set(thisStr)
    return String(charSet)
}

removeDuplicates("aaabbb")

func checkSubTree(_ thisStr: String, _ thatStr: String)->Bool {
    //converted tree to string and checked the substring
    //trees are sorted by default in java
    return thisStr.contains(thatStr)
}

func isPalindrom(_ thisStr: String) -> Bool {
    let revValue = reverseString(original: thisStr)
    return thisStr == revValue
}

func fizzbizz() {
    for index in (1...100) {
        if index % 3 == 0 && index % 5 == 0 {
            print("Fizzbizz")
        }
    }
}

func cipherDemo(_ thisStr: String) -> String {
    var thisArray = Array(thisStr)
    for index in stride(from: 0, to: thisArray.count, by: 1){
        let value = thisArray[index]
        let assciVal = value.asciiValue;
        let newVal = (assciVal ?? 0) + 3
        thisArray[index] = Character(UnicodeScalar(newVal))
    }
    return String(thisArray)
}

print(cipherDemo("Abc"))



