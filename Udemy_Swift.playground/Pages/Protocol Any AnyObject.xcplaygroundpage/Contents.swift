//: [Previous](@previous)

import Foundation

//Required protocol can be implemented by both structs and classes
protocol CarDataSource1 {
    
    var color: String { get set }
    
    func getWheels()
}

struct Car1: CarDataSource1 {
    var color: String
    
    func getWheels() {
        
    }
}

//Optionals protocols can be implemented by only classes
@objc protocol CarDataSource2 {
    
    var color: String { get set }
    
    func getWheels()
    
    @objc optional func getAC()
}

class Car2: CarDataSource2 {
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func getWheels() {
        
    }
}

let car2 = Car2(color: "red")
//car2.getAC() compilation error as getAC is not implemented in Car2

//Better way to implement optionals in extension
protocol CarDataSource3 {
    
    var color: String { get set }
    
    func getWheels()
}

extension CarDataSource3 {
    func getWheels() {
        print("Base Get Wheels")
    }
    func getAC() {
        print("Base Get AC")
    }
}

class Car3: CarDataSource3{
    
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func getWheels() {
        print("Car3 Get Wheels")
    }
}

let car3 = Car3(color: "red")
car3.getWheels()
car3.getAC()

//AnyObject ~ Reference Types
//Any ~ Reference + Value Types + Function Types
//id is mapped to Any rather than AnyObject in swift 3.0

protocol CarDataSource4: class {
    
    var color: String { get set }
    
    func getWheels()
}

//Preferrable way of creating the class only protocol swift 4.0 onwards
//Class only protocol are suited for implementing the delegation pattern
//Associated types are used to define the data types in concrete classes
protocol CarDataSource5: AnyObject {
    
    associatedtype Code
    var prodCode: Code { get }
    
    var color: String { get set }
    
    func getWheels()
}

//Protocol Composition
class Car5: CarDataSource5, CarDataSource1 {
    
    typealias Code = String
    var prodCode: String
    //typealias Code = Int
    //var prodCode: Int
    
    var color: String
    
    init(color: String) {
        self.color = color
        self.prodCode = ""
    }
    
    func getWheels() {
        
    }
}

class Factory {
    func getCar() -> some Car5 {
        return Car5(color: "red")
    }
}
