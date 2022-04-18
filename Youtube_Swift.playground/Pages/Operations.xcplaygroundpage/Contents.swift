//: [Previous](@previous)

import Foundation
import UIKit


//1. Create a operation
let operation1 = BlockOperation()
operation1.addExecutionBlock {
    print("Operation-1")
}

let operation2 = BlockOperation()
operation2.addExecutionBlock {
    print("Operation-2")
}

//2. Create Custom Queue
let customQueue = OperationQueue()

//use main queue for ui updates
//let mainQueue = OperationQueue.main

//3. Addition and Execution on Queue
operation2.addDependency(operation1)
customQueue.addOperation(operation1)
customQueue.addOperation(operation2)
//customQueue.cancelAllOperations()

//4. Creating Custom Operation
final class ImportOperation: Operation {
    let itemProvider: NSItemProvider
    
    init(itemP: NSItemProvider) {
        self.itemProvider = itemP
    }
    
    override func main() {
        
        //return if operation is cancelled
        guard !isCancelled else { return }
        
        //return if dependent operation is cancelled
        guard !dependencies.contains(where: {$0.isCancelled}) else {
            return
        }
        
        print("logic to implement the operation")
    }
}


//Create Operation object
let fileURL = URL(fileURLWithPath: "")
let itemProvider = NSItemProvider(contentsOf: fileURL)
let importOperation = ImportOperation.init(itemP: itemProvider!)
importOperation.completionBlock = {
    print("Import Completed")
}

//Observe the operation
//let observer = importOperation.observeStateChanges()
//Configure the queue
let customQ2 = OperationQueue()
customQ2.addOperation(importOperation)
importOperation.cancel()

//let uploadOperation = UploadOperation()
//uploadOperation.addDependency(importOperation)






