import UIKit

var greeting = "Hello TO Enumeration"

//Enum Example: Defining Various Types
enum SocialPlatform {
    case twitter
    case facebook
    case instagram
    case linkedIn
}

func shareImage(on plateform: SocialPlatform) {
    
    switch plateform {
    case .twitter:
        print("Twitter")
    case .facebook:
        print("Facebook")
    case .instagram:
        print("Instagram")
    case .linkedIn:
        print("LinkedIn")
    }
}
shareImage(on: .twitter)

//Enum Example: Defining Constants of any types
enum ImageAssets {
    static let appIcon = UIImage(systemName: "appIcon")
    static let hamburger = UIImage(systemName: "hamburger")
}
let imgView = UIImageView()
imgView.image = ImageAssets.appIcon

//Enum Example: Raw Values
enum ActivityLevel : String {
    case low = "No of steps less than 5000"
    case medium = "No of steps around 8000"
    case high = "No of steps more than 10000"
}

func getActivityLevelDesc(activityLevel: ActivityLevel)->String {
    return activityLevel.rawValue
}
print(getActivityLevelDesc(activityLevel: .medium))


//Enum Example: Case Iterable
enum AwarenessLevel: String, CaseIterable {
    case low = "Concentration time of 5 mins or less"
    case medium = "Concentration time of 10 mins or less"
    case high = "Concentration time of 15 mins or less"
}

func printAllAwarenessLevel() {
    for awareness in AwarenessLevel.allCases {
        print(awareness.rawValue)
    }
}

//Enum Example: Associated Types
enum EdtechPlateforms {
    case udemy(studentNumber: Int)
    case skillshare(learningTime: Int)
}

func edtechDetail(edTech: EdtechPlateforms) {
    switch edTech {
    case .udemy(studentNumber: let studentNumber) where studentNumber > 100:
        print("doing good on udemy")
    case .skillshare(learningTime: let learningTime) where learningTime > 1000:
        print("doing good on skillshare")
    case .udemy, .skillshare:
        print("Need improvement on udemy")
    }
}
edtechDetail(edTech: .udemy(studentNumber: 100))

//Enum Example: Enum as Structure
enum Student {
    case school(name: String, schoolName: String)
    case college(name: String, collegeName: String)
}

let shoolStudent = Student.school(name: "Christo", schoolName: "Daniel Son")
let collegeStudent = Student.college(name: "Christo", collegeName: "IES IPS")

func displayStudent(student: Student) {
    switch student {
    case .school(name: let name, schoolName: let schoolName):
        print(name + " " + schoolName )
    case .college(name: let name, collegeName: let collegeName):
        print(name + " " + collegeName )
    }
}
displayStudent(student: shoolStudent)

//Enum Example: Enum as Wrapper
struct Car {
    let name: String
}
let car = Car(name: "BMW")

struct Bike {
    let name: String
}
let bike = Bike(name: "RE")

enum Transport {
    case car(Car)
    case bike(Bike)
}

let transport = [Transport.car(car), Transport.bike(bike)]
for trans in transport {
    switch trans {
    case .car( let car):
        print(car.name)
    case .bike(let bike):
        print(bike.name)
    }
}
