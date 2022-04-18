//: [Previous](@previous)

import Foundation

struct Movie {
    var title: String
    var genre: String
    var views: Int
}

struct Library {
    
    let movies = [Movie(title: "LOTR", genre: "Kids", views: 12), Movie(title: "ET", genre: "Fiction", views: 12)]
    
    //COMPUTED PROPERTIES are called during initialisation
    var totalViews: Int {
        print("...COMPUTED PROPERTIES")
        return movies.reduce(0) { value, movie in
            return value + movie.views
        }
    }
    
    lazy var totalViews2: Int =  {
        print("...LAZY PROPERTIES")
        return movies.reduce(0) { value, movie in
            return value + movie.views
        }
    }()
    
    //PROPERTY OBSERVER
    var downloadURL: String? {
        didSet {
            downloadURL = "http://someulr/\(self.totalViews)"
        }
    }
    
    //Lazy PROPERTIES ~ values are not created till it is used first time
}

var lib = Library()
//print(lib.totalViews)
//print(lib.totalViews2)
lib.downloadURL = ""
print(lib.downloadURL!)


