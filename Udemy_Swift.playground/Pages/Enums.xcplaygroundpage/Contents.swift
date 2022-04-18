//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
}

enum TemperatureUnit: String {
case imperial = "F"
case metric = "C"
    
    /*init?(rawValue: String) {
        switch rawValue.lowercased() {
            case "C", "Celcius":
                self = .metric
                break
            case "F", "Faran":
                self = .imperial
                break
            default: return nil
        }
    }*/
}

func getWeatherData(unit: TemperatureUnit) throws {
    
    guard let url = URL(string: "someURL/\(unit.rawValue)") else {
        throw NetworkError.badURL
    }
    
    switch unit {
    case .imperial:
        print(unit.rawValue)
        print(url.description)
        break
    case .metric:
        print(unit.rawValue)
        print(url.description)
    }
}

try getWeatherData(unit: .imperial)
let unitType = TemperatureUnit(rawValue: "C")
try getWeatherData(unit: unitType!)
