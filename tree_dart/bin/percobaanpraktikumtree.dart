import 'dart:collection';
import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class binaryTree <T> {
  Node<T>? root;

  //PreOrder (NLR)
  void printPreOrder (Node? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} ');
      printPreOrder(node.left);
      printPreOrder(node.right);
    }
  }

  //InOrder (LNR)
  void printInOrder (Node? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write('${node.nodeValue} ');
      printInOrder(node.right);
    }
  }

  //PostOrder (LRN)
  void printPostOrder (Node? node) {
    if (node != null) {
      printPostOrder(node.left);
      printPostOrder(node.right);
      stdout.write('${node.nodeValue} ');
    }
  }

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

  //Mencetak Level Order
  void printLevelOrder() {
    int h = height(root);
    for (int i = 0; i <= h; i++) {
      printCurrentLevel(root, i);
    }
  }
 
  int height(Node? root) {
    if (root == null) {
      return 0;
    } else {
      int lheight = height(root.left);
      int rheight = height(root.right);
      return lheight > rheight ? lheight + 1 : rheight + 1;
    }
  }
 
  void printCurrentLevel(Node? root, int level) {
    if (root != null) {
      if (level == 0) {
        print('${root.nodeValue} ');
      } else if (level >= 1) {
        printCurrentLevel(root.left, level - 1);
        printCurrentLevel(root.right, level - 1);
      }
    }
  }


  //Insert Berdasarkan Level
  void insertLevelOrder(T value) {
    Node<T> newNode = Node(value);

    if(root == null) {
      root = newNode;
      return;
    }

    Queue<Node> queue = Queue();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node currentNode = queue.removeFirst();

      if (currentNode.left == null) {
        currentNode.left = newNode;
        return;
      } else {
        queue.add(currentNode.left!);
      }

      if (currentNode.right == null) {
        currentNode.right = newNode;
        return;
      } else {
        queue.add(currentNode.right!);
      }
    }
  }

  //Insert Berdasarkan Target (Linear Search)
  void insertAtTarget(int targetValue, T newValue) {
    if (root == null) {
      root = Node(newValue);
      print('Tree kosong, $newValue ditambahkan sebagai root');
      return;
    }

    final targetNode = findNodeLinear(targetValue);
    if (targetNode == null) {
      print('Target $targetValue tidak ditemukan');
      return;
    }

    if (targetNode.left == null) {
      targetNode.left = Node(newValue);
    } else if (targetNode.right == null) {
      targetNode.right = Node(newValue);
    } else {
      print('$targetValue sudah memiliki kedua child, tidak bisa menambahkan $newValue');
    }
  }

  Node? findNodeLinear(int targetValue) {
    if (root == null) return null;

    final queue = Queue<Node>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();

      if (current.nodeValue == targetValue) {
        return current;
      }

      if (current.left != null) queue.add(current.left!);
        if (current.right != null) queue.add(current.right!);
    }
    return null;
  }

  int maxDepth(Node? node) {
    if (node == null) {
      return 0;
    } else {
      int leftDepth = maxDepth(node.left);
      int rightDepth = maxDepth(node.right);
      return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1;
    }
  }

  //Menghapus data pada binary tree
  void deleteDeepest (Node<T>? root, Node<T> deleteNode) {
    if (root == null) return;

    List<Node<T>> queue = [];
    queue.add(root);

    while  (queue.isNotEmpty) {
      Node<T> temp = queue.removeAt(0);

      if (temp.left != null) {
        if (temp.left == deleteNode) {
          temp.left = null;
          return;
        } else {
          queue.add(temp.left!);
        }
      }

      if (temp.right != null) {
        if (temp.right == deleteNode) {
          temp.right = null;
          return;
        } else {
          queue.add(temp.right!);
        }
      }
    }
  }

  void delete(T key) {
    if (root == null) return;
    if (root!.left == null && root!.right == null) {
      if (root!.nodeValue == key) {
        root = null;
      }
      return;
    }

    List<Node<T>> queue = [];
    queue.add(root!);

    Node<T>? temp;
    Node<T>? keyNode;

    while (queue.isNotEmpty) {
      temp = queue.removeAt(0);
      
      if (temp.nodeValue == key) {
        keyNode = temp;
      }
      if (temp.left != null) {
        queue.add(temp.left!);
      }
      if (temp.right != null) {
        queue.add(temp.right!);
      }
    }

    if (keyNode != null && temp != null) {
      keyNode.nodeValue = temp.nodeValue;
      deleteDeepest(root, temp);
    }
  } 
}