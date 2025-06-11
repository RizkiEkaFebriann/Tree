import 'dart:io';
class Node<T> {
  T nodeValue;
  Node<T>? left, right, parent;

  Node(this.nodeValue, [this.parent]);
}

class BinarySearchTree<T extends Comparable> {
  Node<T>? root;
  int treeSize = 0;

  bool? add(T newValue) {
    Node<T>? node = root, parent;
    int orderValue = 0;

    while (node != null) {
      parent = node;
      orderValue = newValue.compareTo(node.nodeValue);

      if (orderValue == 0) {
        return false;
      } else if (orderValue < 0) {
        node = node.left;
      } else {
        node = node.right;
      }
    }

    Node<T> newNode = Node(newValue, parent);
    if (parent == null) {
      root = newNode;
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }

    treeSize++;
    return true;
  }

  Node<T>? findNode(T data) {
    Node<T>? node = root;
    int orderValue = 0;
    
    while (node != null) {
      orderValue = data.compareTo(node.nodeValue);
      
      if (orderValue == 0) {
        return node;
      } else if (orderValue < 0) {
        node = node.left;
      } else {
        node = node.right;
      }
    }
    return null;
  }

  T? first() {
  Node<T>? current = root;

  if (current == null) {
    return null;
  }

  while (current!.left != null) {
    current = current.left;
  }

  return current.nodeValue;
  } 


  // bool find(T item) {
  //   Node<T> t = findNode(T data);

  //   if (t != null) {
  //     T value = t.nodeValue;
  //     return true;
  //   }
  //   return false;
  // }

  void printTree([Node<T>? node, String prefix = '', bool isLeft = true]) {
    node ??= root;
    if (node == null) return;

    if (node.right != null) {
      printTree(node.right, prefix + (isLeft ? "│   " : "    "), false);
    }

    stdout.write(prefix);
    stdout.write(isLeft ? "└── " : "┌── ");
    print(node.nodeValue);

    if (node.left != null) {
      printTree(node.left, prefix + (isLeft ? "    " : "│   "), true);
    }
  }

  void removeNode(Node<T>? dNode) {
    if (dNode == null) {
      return;
    }

    Node<T>? pNode, rNode;
      pNode = dNode.parent; 

      if (dNode.left == null || dNode.right == null) {
        if (dNode.right == null) {
          rNode = dNode.left;
      } else {
        rNode = dNode.right;
      }
      if (rNode != null) {
        print("Set Parent");
        rNode.parent = pNode;
      }

      if (pNode == null) {
        root = rNode;
      } else if((dNode.nodeValue as Comparable<T>).compareTo(pNode.nodeValue) < 0) {
        pNode.left = rNode;
      } else {
        pNode.right = rNode;
      }

    } else {
        Node<T>? pOfRNode = dNode; 
        rNode = dNode.right; 
        pOfRNode = dNode;

        while (rNode!.left != null) {
          pOfRNode = rNode;
          rNode = rNode.left;
        }

        dNode.nodeValue = rNode.nodeValue;
        
        if (pOfRNode == dNode) {
          dNode.right = rNode.right;
        } else {
          pOfRNode!.left = rNode.right;
       }
        if (rNode.right != null) {
          rNode.right!.parent = pOfRNode;
        }
      }
    }

  void PreOrder() {
    if (root == null) return;

    List stack = <Node<T>> [];
    stack.add(root!);

    while (stack.isNotEmpty) {
      final current = stack.removeLast();
      stdout.write('${current.nodeValue} ');

      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
  }

  void InOrder() {
    var stack = <Node<T>>[];
    var current = root;

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }

      current = stack.removeLast();
      stdout.write('${current.nodeValue} ');
      current = current.right;
    }
  }

  void PostOrder() {
    if (root == null) return;

    List stack1 = <Node<T>> []; //untuk proses traversal awal
    List stack2 = <Node<T>> []; //untuk menyimpan urutan hasil post-order
    stack1.add(root!);

    while (stack1.isNotEmpty) {
      var current = stack1.removeLast();
      stack2.add(current);

      if (current.left != null) stack1.add(current.left!);
      if (current.right != null) stack1.add(current.right!);
    }

    while (stack2.isNotEmpty) {
      stdout.write('${stack2.removeLast().nodeValue} ');
    }
  }
}
