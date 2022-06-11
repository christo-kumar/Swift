import UIKit
import Foundation

var greeting = "Error Handling"

//Error Handling Example-1
//Defining Error
enum BankAccountError: Error {
    case insufficientFunds
    case invalidAccount
}

class BankAccount {
    var balance: Double
    
    init(_ bal: Double) {
        self.balance = bal
    }
    
    func withdraw(amt: Double) throws {
        if balance < amt {
            throw BankAccountError.insufficientFunds
        }
        balance -= amt
    }
}

var account = BankAccount(100)
do {
    try account.withdraw(amt: 300)
} catch  {
    if let bankError = error as? BankAccountError {
        switch bankError {
        case .insufficientFunds:
            print("Insufficent funds")
        case .invalidAccount:
            print("Invalid Account")
        }
    }
}

//Error Handling Example-2
enum NetworkError: Error {
    case badUrl
    case decodingError
    case badRequest
    case noData
    case custom(Error)
}
struct Post: Decodable {
    let title: String
    let body: String
}

func getPost(completion: @escaping (Result<[Post], NetworkError>)->Void) {
    guard let url = URL(string: "https://xyz.....") else {
        completion(.failure(.badUrl))
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(.custom(error)))
        } else if ((response as? HTTPURLResponse)?.statusCode != 200) {
            completion(.failure(.badRequest))
        } else {
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let posts = try? JSONDecoder().decode([Post].self, from: data)
            if let posts = posts {
                completion(.success(posts))
            } else {
                completion(.failure(.decodingError))
            }
        }
    }.resume()
}

getPost { result in
    switch result {
    case .success(let posts):
        print(posts)
    case .failure(let error):
        print(error)
    }
}

//Error Bubbling
enum PizzaBuilderError: Error {
    case doughBurnt
    case noToppings(String)
}
struct Pizza {
    let dough: String
    let topping: [String]
}

struct PizzaBuilder {
    func prepare()-> Pizza? {
        do {
            let dough = try prepareDough()
            let topping = try prepareTopping()
            let pizza = Pizza(dough: dough, topping: topping)
            return pizza
        } catch {
            print("Unable to prepare the Pizza")
            return nil
        }
    }
    
    private func prepareDough() throws -> String {
        throw PizzaBuilderError.doughBurnt
    }
    
    private  func prepareTopping() throws -> [String] {
        throw PizzaBuilderError.noToppings("Chicken and Onions are missing.")
    }
}
