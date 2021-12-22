import UIKit
import Foundation

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

/////////////////////////////////////////////////////////////// Sub tree detection /////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////// Linked List ////////////////////////////////////////////////////////////////////////////
class LLNode {
    
    var value: Int
    var next: LLNode?
    
    init(value: Int) {
        self.value = value
        self.next = nil
    }
}

class LinkedList {
    var head: LLNode
    var size: Int
    
    init(headValue: Int) {
        head = LLNode(value: headValue)
        size = 1
    }
    
    func add(value: Int) {
        addNode(value: value, node: head)
    }
    
    func addNode(value: Int, node: LLNode?) {
        guard let current = node else {
            return
        }
        if current.next == nil {
            current.next = LLNode(value: value)
        } else {
            addNode(value: value, node: current.next)
        }
    }
    
    func find(value: Int) -> LLNode? {
        if head.value == value {
            return head
        }
        return findNode(value: value, node: head)
    }
    
    func findNode(value: Int, node: LLNode?) -> LLNode? {
        guard let next = node?.next else {
            return nil
        }
        if next.value == value {
            return node
        } else {
            print(next.value)
            return findNode(value: value, node: node?.next)
        }
    }
    
    
    func delete(value: Int) {
        if head.value == value {
            //head = head.next ??
        } else {
            let node = find(value: value)
            if let prevNode = node {
                if let delNode = prevNode.next {
                    if let nextNode = delNode.next {
                        prevNode.next = nextNode
                    } else {
                        prevNode.next = nil
                    }
                }
            }
        }
    }
    
    func travLinkedList(node: LLNode?) {
        if let current = node {
            print(current.value)
            travLinkedList(node: current.next)
        }
    }
    
    func dupLinkedList(fast: LLNode?, slow: LLNode?) -> Bool {
        guard let fastNode = fast else {
            return false
        }
        
        guard let slowNode = slow else {
            return false
        }
        print(fastNode.value)
        print(slowNode.value)
        if fastNode.value == slowNode.value {
            return true
        }
        
        return dupLinkedList(fast: fastNode.next, slow: slowNode.next)
        
    }
}



var linkedList: LinkedList = LinkedList(headValue: 1)
linkedList.add(value: 3)
linkedList.add(value: 5)
linkedList.add(value: 8)
linkedList.add(value: 13)
linkedList.delete(value: 13)
linkedList.delete(value: 5)
linkedList.travLinkedList(node: linkedList.head)






