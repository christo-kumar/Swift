//: [Previous](@previous)

import Foundation

struct Movie {
    let title: String
    let genre: String
}

let movies = [Movie(title: "LOTR", genre: "Kids"), Movie(title: "ET", genre: "Fiction")]

//Iterating
var itr = movies.makeIterator()
while let movie = itr.next() {
    print(movie.title)
}

//for in
for movie in movies {
    print(movie.title)
}

//for in enumerated
for (index, movie) in movies.enumerated() {
    print("\(index) - \(movie.title)")
}

//for in countable range
for index in 0..<movies.count {
    print(movies[index].title)
}

//for each
movies.forEach { movie in
    print(movie.title)
}

//for each enumerated
movies.enumerated().forEach { (index, movie) in
    print("\(index) - \(movie.title)")
}


//Creating custom iterator
struct CountDown: Sequence {
    let start: Int
    func makeIterator() -> some IteratorProtocol {
        return CountDownIterator(self)
    }
    
}

struct CountDownIterator: IteratorProtocol {
    
    let coutDown: CountDown
    let currentVal = 0
    init(_ countD: CountDown) {
        coutDown = countD
    }
    
    mutating func next() -> Int? {
        return currentVal
    }
    
    
}
