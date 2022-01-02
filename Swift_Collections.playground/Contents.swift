import UIKit


//Sets
var activeQuests: Set = ["GK","CF","LF","LF"];
var completedQuests: Set = ["GK","CF","RF"];

// Set operations
//var commanQuests = activeQuests.intersection(completedQuests);
//print(commanQuests);
//var differentQuests = activeQuests.symmetricDifference(completedQuests);
//print(differentQuests);
var allQuests = activeQuests.union(completedQuests);
print(allQuests);

//Tupple
var episodeTuple: (season: Int, episode: Int, name: String) = (1,1,"Winter is coming")
print(episodeTuple.season)
print(episodeTuple.0)
print(episodeTuple.episode)
print(episodeTuple.1)
print(episodeTuple.name)
print(episodeTuple.2)

//Dictiory
var episodName: [Int:String] = [1:"Winter is coming", 2: "Xyz"]
episodName[2] = "The Kingsroad"
episodName[3] = "Lord Snow"
episodName[4] = "Cripples, Bastards and Broken Things"
episodName[5] = "The Wolf and the Lion"
episodName.updateValue("Lord Jon Snow", forKey: 3)
episodName.removeValue(forKey: 5)

for key in episodName.keys {
    print(episodName[key] ?? "")
}

for index in 1...episodName.keys.count {
    print(episodName[index] ?? "")
}

var seasonName: Dictionary<Int,String> = Dictionary<Int, String>()
seasonName[1] = "Season One"
seasonName[2] = "Season Two"

for key in seasonName.keys {
    print(seasonName[key] ?? "")
}



//Arrays
var starks: [String] = ["Ned","Cat","Rob","Sansa","Arya","Bryan"]
starks.append("Rickon")
starks[1] = "Catherine"
starks.insert("Jon", at: 4);

var lannisters: Array<String> = Array<String>()
lannisters.append("Tywin")
lannisters.append("Tyrion")
lannisters.append("Jammie")
lannisters.append("Cersie")

lannisters.isEmpty

//1. Simple Iteration
for stark in starks {
    print(stark)
}

//2. Range based traversing
print("*******")
var lanisterRange: CountableRange = 0..<lannisters.count
for index in 0..<starks.count {
    print(starks[index])
}

//3. Range Based Travesing - Another flavour
for index in (0..<starks.count).reversed() { //Reverse traversing
    print(starks[index])
}

//4. Index Based Travesing
for (index, name) in starks.enumerated(){
    print("\(index) : \(name)")
}

//5. Index Based Travesing - Another flavour
for index in stride(from: starks.count-1, to: 0, by: -1) {
   print(starks[index])
}

//While - Loop
var index = 0;
while index < starks.count {
    starks[index]
    index += 1
}

//do-While - Loop
var repeatIndex = 0
repeat {
  print(lannisters[repeatIndex])
  repeatIndex += 1
} while repeatIndex < lannisters.count

//Array Methods
lannisters.insert("Tywin the great", at: 0) //O(n)
lannisters.remove(at: 0) //O(n)
var rev: Array<String> = lannisters.reversed()
for index in lanisterRange {
    print(rev[index])
}
lannisters.sort()
for index in lanisterRange {
    print(lannisters[index])
}

