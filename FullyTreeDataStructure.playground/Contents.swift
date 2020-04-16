import UIKit

var str = "Hello, playground"

class Tree {
    var left:Tree?
    var right:Tree?
    var data:Int
    var parent : Tree?
    
    init(_ data:Int) {
        self.data = data
    }
    
    func insertData (_ data:Int) {
        if let _ = self.parent {
            print("Parent already exist")
            return
        }
        
        addNode(data)
    }
    
    private func addNode(_ data:Int) {
        if data < self.data {
            if let leftChild = self.left {
                leftChild.addNode(data)
            } else {
                let newNode = Tree(data)
                newNode.parent = self
                left = newNode
            }
        } else {
            if let rightChild = self.right {
                rightChild.addNode(data)
            } else {
                let newNode = Tree(data)
                newNode.parent = self
                right = newNode
                            
            }
        }
    }
    
    func preOrderTraverse (_ node:Tree?) {
        if node == nil {
            return
        }
        print(node?.data ?? 0, terminator:" ")
        preOrderTraverse(node?.left )
        preOrderTraverse(node?.right)
    }
    
    func inOrderTraverse(_ node:Tree?) {
        if node == nil {
            return
        }
        
        inOrderTraverse(node?.left)
        print(node?.data ?? 0, terminator:" ")
        inOrderTraverse(node?.right)
    }
    
    func postOrderTraverse(_ node:Tree?) {
        if node == nil {
            return
        }
        
        postOrderTraverse(node?.left)
        postOrderTraverse(node?.right)
        print(node?.data ?? 0, terminator:" ")
    }
}


let tree = Tree(10)
tree.insertData(20)
tree.insertData(5)
tree.insertData(21)
tree.insertData(4)
tree.insertData(8)
print("PreOrder")
tree.preOrderTraverse(tree)

print("\nIn Order")

tree.inOrderTraverse(tree)
print("\nPost order")
tree.postOrderTraverse(tree)


