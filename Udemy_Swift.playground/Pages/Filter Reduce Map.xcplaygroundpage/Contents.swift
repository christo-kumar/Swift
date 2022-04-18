import UIKit

struct Movie {
    let title: String
    let genre: String
    let views: Int
}

let movies = [Movie(title: "LOTR", genre: "Kids", views: 12), Movie(title: "ET", genre: "Fiction", views: 12)]

let kidMovies = movies.filter { movie in
    return movie.genre == "Kids"
}
print(kidMovies)

let viewsC = movies.map { movie -> Int in
    return movie.views
}
print(viewsC)

let totalViews = movies.reduce(0) { value, movie in
    value + movie.views
}
print(totalViews)

let total = viewsC.reduce(0, +)
print(total)


//MAP and FILTER
let indexes = 1..<5000
let images = indexes.lazy.filter { index -> Bool in
    return index % 2 == 0
}.map { index -> String in
    return "image-\(index)"
}
let lastthree = images.suffix(3)
for ima in lastthree {
    print(ima)
}

let ratings = [4, 6, 3]
let results = ratings.reduce(into: [:]) { (results: inout [String: Int], rating) in
    switch rating {
    case 1..<4:
        results["Very Bad", default: 0] += 1
        break
    default: break
    }
}

let pair = zip(movies, ratings)

for movieRating in pair {
    print(movieRating.0)
    print(movieRating.1)
}

