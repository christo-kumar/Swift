//: [Previous](@previous)

import Foundation



//1. Default and Custom Initialisers
struct Movie  {
    let title: String
    let genre: String
    let views: Int
}

extension Movie {
    init(title: String, genre: String) {
        self.title = title
        self.genre = genre
        self.views = 0
    }
}

//2. Convinience Initialiser & Required
protocol CarType{
    init(make: String)
}

class Car: CarType {
    
    var make: String
    var model: String
    var color: String
    
    init(make: String, model: String, color: String) {
        self.make = make
        self.model = model
        self.color = color
    }
    
    required convenience init(make: String){
        self.init(make: make, model: "", color: "")
    }
}

class Tesla: Car {
    var range: Int
    
    init(make: String, model: String, color: String, range: Int) {
        self.range = range
        super.init(make: make, model: model, color: color)
    }
    
    required convenience init(make: String) {
        fatalError("init(make:) has not been implemented")
    }
}


