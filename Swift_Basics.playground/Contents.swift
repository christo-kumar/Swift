import UIKit

//MARK -- Variables and Constants
var greeting = "Welcome to "
let  seriesName = "Games of throne"

//Type inference
var episode = 9
let season = 1

//Type annotation
var firstCharacterName: String
firstCharacterName = "Tyrion Lanistoer"
var firstAge: Int
firstAge = 45

var secondCharacterName: String
secondCharacterName = "Cersie Lanister"
var secondAge: Int
secondAge = 40

print("\(greeting) \(seriesName) season: \(season) episode: \(episode)")
print("This is the story of")
print("\(firstCharacterName) age \(firstAge) and his sister")
print("\(secondCharacterName) age \(secondAge)")

//Arithematic Operators
// + - / * %
//Compound Assignment
//+=, -=, *=, /=, %=
//Comparison
//(==, !=, >, <, >=, <=)
//Logical operators
//(!, &&, ||)
//Ranges
//(1...5 or 1..<5)
var upcomingSeason = ((5 + 4 - 3) / 2 * 1) % 4
print("Season: \(upcomingSeason) would be an interesting one.")

upcomingSeason += 2
print("Season: \(upcomingSeason) would be an interesting one.")

upcomingSeason *= 2
print("Season: \(upcomingSeason) would be the last one.")

if(upcomingSeason == 10) {
    let txt: String = "This is the last season" + " Oh No"
    print(txt)
} else if (upcomingSeason < 10) {
    print("Show will go on.")
} else {
    print("This cannot happen.")
}

//ClosedRange, CountableClosedRange, Range, CountableRange
var seasonRange: CountableClosedRange = 1...10
for season in seasonRange {
    print("You are watching season: \(season) of GOT")
}

//String Methods
var dialog = "Winter is coming at Stark's Winterfell."
dialog.count
dialog.isEmpty
dialog.contains("'")

dialog.append(contentsOf: ", My lady")
dialog.removeLast()
dialog.removeFirst()
dialog.removeAll()

dialog.split(separator: "'")

//Type conversion happens via constructor
var tyrionHeightDouble = 3.234
var tyrionHeightInt: Int = Int(tyrionHeightDouble)
var tyrionHeightString: String = String(tyrionHeightInt)

//Optionals - By default nil
var knightKing: String?
var knigthAge: Int? = 50

if let name = knightKing, let age = knigthAge {
    print(name, age)
} else {
    print("Not found")
}

//Gaurd
func gaurdTheWall() {
    guard let name = knightKing else {
        print("Wall is safe")
        return
    }
    print("Need action against \(name)")
}
gaurdTheWall()







