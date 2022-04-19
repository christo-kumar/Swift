//: [Previous](@previous)

import Foundation
import Security

//1. Throwing Error
enum BankAccountError: Error {
    case insufficientFunds
}

class BankAccount {
    var balance: Int
    
    //Validating Type
    init(balance: Int) throws {
        self.balance = balance
    }
    
    func withdraw(amount: Int) throws {
        if balance < amount {
            throw BankAccountError.insufficientFunds
        }
    }
}

let account = try? BankAccount(balance: 100)
do {
    try account?.withdraw(amount: 200)
} catch let error as BankAccountError {
    switch error {
    case .insufficientFunds:
        print("---")
        break
    }
}

//2. Passing Error in callback
enum NetworkError: Error {
    case badURL
    case badResponse(String)
}

func getPosts(completion: @escaping (String?, Error?)->()) {
    
    guard let url = URL(string: "") else {
        completion(nil,NetworkError.badURL)
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let response = response as? HTTPURLResponse {
            if (response.statusCode != 200) {
                completion(nil, NetworkError.badResponse("bad url"))
            }
        }
    }
    
}
