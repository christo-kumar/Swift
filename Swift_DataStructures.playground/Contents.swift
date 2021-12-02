import UIKit

//Tree
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class Tree {
    
    var root: Node?
    
    init(value: Int) {
        root = Node(value: value)
    }
    
    func add(value: Int) {
        addNode(value: value, node: root)
    }
    
    func find(value: Int) -> Node? {
        return findNode(value: value, node: root)
    }
    
    func findNode(value: Int, node: Node?) -> Node? {
        
        guard let current = node else {
            return nil
        }
        
        if value == current.value {
            return node
        } else {
            if value < current.value {
                findNode(value: value, node: current.left)
            } else if value > current.value {
                findNode(value: value, node: current.right)
            }
        }
        
        return nil
    }
    
    func findMin(node: Node?) -> Node? {
        
        guard let current = node else {
            return nil
        }
        
        if (current.left == nil) {
            return current
        }
        
        return findMin(node: current.left)
    }
    
    func addNode(value: Int, node: Node?) {
        if let current = node {
            if value > current.value {
                if current.right == nil {
                    let newNode = Node(value: value)
                    current.right = newNode
                } else {
                    addNode(value: value, node: current.right)
                }
            } else if  value < current.value {
                if current.left == nil {
                    let newNode = Node(value: value)
                    current.left = newNode
                } else {
                    addNode(value: value, node: current.left)
                }
            }
        }
    }
    func copyLeft(current: Node) {
        if let left = current.left {
            current.value = left.value
            copyLeft(current: left)
        }
    }
    
    func copyRight(current: Node) {
        if let right = current.right {
            current.value = right.value
            copyLeft(current: right)
        }
    }
    
    func deleteNode(foundNode: Node) {
        var childCount: Int = 0
        var hasLeft: Bool = false
        var hasRight: Bool = false
        
        if foundNode.left != nil {
            childCount += 1
            hasLeft = true
        }
        
        if foundNode.right != nil {
            childCount += 1
            hasRight = true
        }
        
        if childCount == 1 && hasLeft == true {
            copyLeft(current: foundNode)
        }
        
        if childCount == 1 && hasRight == true {
            copyRight(current: foundNode)
        }
        
        if childCount == 2 {}
    }
    
    func delete(value: Int) {
        let node = find(value: value)
        
        guard let foundNode = node else {
            return
        }
        deleteNode(foundNode: foundNode)
    }
    
    func inOrder(node: Node?) {
        
        guard let current = node else {
            return
        }
        //Left Root Right
        inOrder(node: current.left)
        print(current.value)
        inOrder(node: current.right)
        
    }
    
    func preOrder(node: Node?) {
        
        guard let current = node else {
            return
        }
        //Root Left Right
        print(current.value)
        preOrder(node: current.left)
        preOrder(node: current.right)
    }
    
    func postOrder(node: Node?) {
        guard let current = node else {
            return
        }
        //Left Right Root
        postOrder(node: current.left)
        postOrder(node: current.right)
        print(current.value)
    }
}

var tree = Tree(value: 5)
tree.add(value: 6)
tree.add(value: 3)
tree.add(value: 7)
//tree.preOrder(node: tree.root)
tree.inOrder(node: tree.root)
//tree.postOrder(node: tree.root)



