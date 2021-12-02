import UIKit
import Darwin

var greeting = "Hello, playground"

//Factorial
func factorial(number: Int) -> Int{
    if number <= 0 {
        return 1
    }
    return number * factorial(number: number - 1)
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
    var charArray = Array(original)
    let arraySize = charArray.count - 1
    let midIndex = charArray.count/2
    for index in stride(from: 0, to: midIndex, by: 1) {
        let srcIndex = index
        let destIndex = arraySize - index
        let hold = charArray[srcIndex]
        charArray[srcIndex] = charArray[destIndex]
        charArray[destIndex] = hold
    }
    return String(charArray)
}
print(reverseString(original: "catap"))

//Bubble Sort
//Compare with Adjacent
//Each pass results in the greates being bubled to highest index
func bubleSort(arr: [Int])-> [Int] {
    let arrSize = arr.count-1
    var copyArray = arr
    for outer in stride(from: 0, to: arrSize, by: 1) {
        let destIndex = arrSize - outer
        for index in stride(from: 0, to: destIndex, by: 1) {
            let cmpIndex = index + 1
            if copyArray[index] > copyArray[cmpIndex] {
                let temp = copyArray[index]
                copyArray[index] = copyArray[cmpIndex]
                copyArray[cmpIndex] = temp
            }
        }
    }
    return copyArray
}
print(bubleSort(arr: [2,3,4,1]))

//Palantroms
func isPalindrom(str: String) -> Bool {
    let revStr = reverseString(original: str)
    if revStr == str {
        return true
    }
    return false
}
print(isPalindrom(str: "bab"))

//All unique characters
//Anagram can be implemented with same logic
//comparing the numbers for each character in the map
func isUniqueCharacter(str: String) -> Bool {
    let charArr = Array(str)
    var charMap: [Character: Int] = [:]
    for char in charArr {
        var count = charMap[char] ?? 0
        count += 1
        charMap[char] = count
    }
    
    for count in charMap.values {
        if count != 1 { return false }
    }
    return true
}

print(isUniqueCharacter(str: "abb"))

//urlifyString
//Asci encode
//Spil the string and concatinate

func urlifyString(str: String) -> String{
    let splits = str.split(separator: Character(" "))
    var urlFied = ""
    for index in stride(from: 0, to: splits.count - 1, by: 1) {
        if (index == 0) {
            urlFied = urlFied + splits[index] + "%32" + splits[index+1]
        } else {
            urlFied = urlFied + "%32" + splits[index+1]
        }
    }
    return urlFied
}

print(urlifyString(str: "How are you dear"))
