import UIKit


//====================== Structure Initializers ==================

var greeting1 = "Welcome to Structure Initializers"
print(greeting1)

//====================== Default Initializers ====================
struct Student {
    let firstName: String
    let lastName: String
}

//default initialiser is provided for structure which includes all the member variables
let student1 = Student(firstName: "Christo", lastName: "Kumar")

//==================== Custom Initializer ========================
struct Car {
    let make: String
    let model: String
    
    //Custom Initialiser
    init(_ make: String) {
        self.make = make
        self.model = "base"
    }
}

//default initialiser is GONE, if we provide custom initialiser
let car1 = Car("BMW")

//==================== Initializer in Structure Extension ============
struct Employee {
    let firstName: String
    let lastName: String
    let department: String
}

extension Employee {
    
    init(first: String, last: String) {
        self.firstName = first
        self.lastName = last
        department = "Default"
    }
}

//Benefit is both Custom and Default Initialisers are present
let emloyee1 = Employee(first: "Christo", last: "Kumar")
let employee2 = Employee(firstName: "Ayaan", lastName: "Kumar", department: "Diver")

//====================== Class Initializers ==================

//In swift class does not provides the default initialisers for its members
class Person {
    var firstName: String
    var lastName: String
    var gender: String
    
    //Designated Initializer - It must initialise all the non optional members of the class
    init(_ first: String, _ last: String, _ gender: String) {
        self.firstName = first
        self.lastName = last
        self.gender = gender
    }
    
    //Convenience Init - It internally calls the designated initialisers with default parameter
    convenience init(_ first: String, _ last: String) {
        self.init(first, last, "default")
    }
}

//====================== Failable Initializers ==================
//It can return nil object if parameters are not passed properly.
class Department {
    var deptName: String

    init?(_ name: String) {
        if (name.isEmpty) {
            return nil
        }
        deptName = name
    }
    
    convenience init?() {
        self.init("Default")
    }
}

//====================== Required Initializers ==================
protocol AccountProto {
    var custName: String {get}
    init (_ name: String)
}

class Account: AccountProto {
    
    var custName: String
    var balance: Int
    
    init(_ name: String, _ balance: Int) {
        self.custName = name
        self.balance = balance
    }
    
    required convenience init (_ name: String) {
        self.init(name, 0)
    }
}

class SavingAccount: Account {
    var interestRate: Int
    
    //By overrideing the Method required initialier will be implemented by base class only
    //However it creates the tight coupling in the system.
    /*override init(_ name: String, _ balance: Int) {
        self.interestRate = 0
        super.init(name, balance)
    }*/
    
     init(_ name: String, _ balance: Int, _ intRate: Int) {
        self.interestRate = intRate
        super.init(name, balance)
    }
    
    required convenience init(_ name: String) {
        fatalError("init(_:) has not been implemented")
    }
    
}
