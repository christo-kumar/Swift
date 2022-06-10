import UIKit

/**===========================  FUNCTIONS ==================================== **/

//1. Simple Function
func winterFell(lord: String,_ lady: String = "Cat Stark") -> String {
    return "This is winterfell of \(lord) and \(lady)"
}
print(winterFell(lord: "Ned Stark", "Catherine"))
print(winterFell(lord: "Ned Stark"))

//2. Returning multiple values
func starkSiblings()->(eldest:String, youngest: String ) {
    return ("Arya", "Rickon")
}
var retval = starkSiblings()
print("\(retval.eldest) \(retval.youngest)")

func somefunction() -> (retval1: String, reval2: String) {
    return ("Hello","World")
}
let tup = somefunction()
print(tup.retval1)

//3. Variadic parameters
func lannisterFamily(lannisters: String ...) {
    for lannister in lannisters {
        print(lannister)
    }
}

lannisterFamily(lannisters: "Cersie", "Jammie", "Tyrion")

func variadicDemo(params: String...) {
    for param in params {
        print(param)
    }
}
variadicDemo(params: "Hello", "World")

//4. Passing as a Reference
func addBustardSurname(first: inout String, second: inout String) {
    first = first + " Snow"
    second = second + " White"
}

var first = "Jon", second = "Ramsey"
addBustardSurname(first: &first, second: &second)
print("\(first) \(second)")

func passByRefDemo(param: inout String) {
    param = param + " World"
}
var str = "Hello"
passByRefDemo(param: &str)
print(str)


/**===========================  FUNCTIONS TYPES ==================================== **/
//1. Basic Example
var basicArthematic: (Int, Int) -> Int

func addTwoNumber(_ a: Int, _ b: Int)  -> Int {
    return a + b
}

func multiply(_ a: Int, _ b: Int)  -> Int {
    return a * b
}

basicArthematic = addTwoNumber
print(basicArthematic(1,2))

//2. Function type as Parameter
func wrapperFunction(param : (Int, Int) -> Int) {
    print(param(1,2))
}
wrapperFunction(param: multiply)

//3. Function Type as Return Type
func whichFunction(isAdd : Bool = false) -> (Int, Int) -> Int {
    return isAdd ? addTwoNumber : multiply
}

print(whichFunction()(2,2))

/**===========================  CLOSURES ==================================== **/

//NON-Escaping Clousures, Trailing Closure
func closureDemo1(param: (String) -> Void) {
    param("Hello World")
}

closureDemo1 { param in
    print(param)
}

//Escaping Closures
func closureDemo2(param: @escaping (String)->Void) {
    sleep(5)
    param("Hello World")
}

closureDemo2 { param in
    print("Hello World")
}

//Closure as returned type
func retvalFunc(param: String)-> Void {
    print(param)
}

func closureDemo3() -> (String)->Void {
    return retvalFunc
}
closureDemo3()("Hello")

/**===========================  HOF  ==================================== **/
var randomArray: [Int] = [4,3,8,9,11]

//1. Map
var doubledArray = randomArray.map { valueAtIndex in
    return valueAtIndex * 2
}
print(doubledArray)
var trippledArray = randomArray.map { param in
    return param * 3
}
print(trippledArray)

//2. Filter
var filteredArray = randomArray.filter { valueAtIndex in
    return valueAtIndex > 5
}
print(filteredArray)


//4. Reduce - Multiply or add all the elements
var combinedAsString = randomArray.reduce("") {(result, a) -> String in
    return result + String(a)
}
print(combinedAsString)
var allAdded = randomArray.reduce(0,+)
print(allAdded)
var allMultiplied = randomArray.reduce(1) { result, param in
    return result * param
}

//5. Sorted
var sortedArray = randomArray.sorted { val1, val2 in
    return val1 > val2
}

var desSorted = randomArray.sorted { val1, val2 in
    return val1 < val2
}
print(sortedArray)
print(desSorted)










