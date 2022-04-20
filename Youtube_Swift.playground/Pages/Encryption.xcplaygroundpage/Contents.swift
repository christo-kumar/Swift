//: [Previous](@previous)

import CryptoKit
import Foundation
import UIKit


var greeting = "Hello, playground"
let data = Data(greeting.utf8)
let digest = SHA256.hash(data: data)
let hash = digest.compactMap { String(format: "%02x", $0) }.joined()
print(hash)
//let digest =

let key = SymmetricKey(size: .bits256)
