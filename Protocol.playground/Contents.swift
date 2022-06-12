import UIKit

var greeting = "Hello, playground"

protocol Deployable {
    //Concrete type to be defined later
    associatedtype Item
    func append(_ item: Item)
}

protocol Employable {
    associatedtype Item
    var firstName: Item {get set}
    var fullName: Item {get}
}

class Employee: Employable {
    //Concrete type defined
    typealias Item = String
    
    //Properties
    var reportees = Array<String>()
    var firstName: String
    var fullName: String {
        return "Mr. " + firstName
    }
    
    init(_ name: String) {
        firstName = name
    }
}

extension Employee: Deployable {
    func append(_ item: String) {
        reportees.append(item)
    }
}

//=============== Protocol Inheritence ==============
protocol EmployeeProto: Employable, Deployable {
    func getSalary() -> Int
}

//=============== Protocol Composition ==============
typealias MultipleProtocols = Employable & Deployable


//============== Class Only Protocol ================
protocol SomeClassOnly: AnyObject {
    func addToList(_ item: String)
}

//============== Default Implementation =============
extension SomeClassOnly {
    func addToList(_ item: String) {
        print("Default Implementation of addToList")
    }
}

//=============== Protocol Conformanc ==============
class SomeClass: SomeClassOnly {}
let obj = SomeClass()
if obj is SomeClassOnly {}


//=============== Optional Protocol ================
@objc protocol Countable {
    @objc optional func displayCount()
}

//============= Default Equatable ==================
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}


//============= Custom Equatble ====================
struct Car: Equatable {
    let make: String
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.make == rhs.make
    }
}

//============== Comparable Protocol =============
struct Student: Comparable {
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.marks < rhs.marks
    }
    
    let name: String
    let marks: Double
}

//============ Custom Hashable ====================

struct Person {
    let name: String
}

struct Account: Hashable {
    
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.account.name == rhs.account.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(account.name)
    }
    
    let account: Person
}

struct Post {
    let text: String
}

//============== Sequence Protocol ==========

struct CountDown: Sequence {
    let start: Int
    //some ~ will know the concrete type of iterator protocol
    func makeIterator() -> some IteratorProtocol {
        MyIterator(self)
    }
}

struct MyIterator: IteratorProtocol {
    let countdown: CountDown
    var currentValue: Int
    
    init(_ cntd: CountDown) {
        countdown = cntd
        currentValue = countdown.start
    }
    
    //This method needs to be implemented - Could have been a better example
    mutating func next() -> Int? {
        currentValue -= 1
        return currentValue >= 0 ? currentValue : nil
    }
}

func demo() {
    let coutDown = CountDown(start: 10)
    for count in coutDown {
        print(count)
    }
}

demo()

//=========== Conditional Conformance =========
protocol CartProtocol {
    func computeTotal() -> Double
}

struct CartItem {
    let name: String
    let price: Double
}




