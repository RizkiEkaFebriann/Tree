// import 'percobaanpraktikumtree.dart';
import 'bst.dart';
// import 'percobaanpraktikumtree.dart';

void main () {
  // binaryTree bt = binaryTree();
  BinarySearchTree bst = BinarySearchTree();
  
  bst.add(30);
  bst.add(15);
  bst.add(17);
  bst.add(36);
  bst.add(67);
  bst.add(30);
  bst.add(69);
  
  // var node = bst.findNode(15);
  // if (node != null) {
  //   print('\nNode target ${node.nodeValue} ditemukan');
  // } else {
  //   print('Node not found');
  // }

  print('Nilai Terkecil : ${bst.first()}'); 
  bst.printTree();
  print('Traversal PreOrder');
  bst.PreOrder();

  print('\nTraversal InOrder');
  bst.InOrder();

  print('\nTraversal PostOrder');
  bst.PostOrder();

  // bt.root = Node(10);
  // bt.root!.left = Node(20);
  // bt.root!.right = Node(30);
  // bt.root!.right!.left = Node(40);

  // bt.insertLevelOrder('A');
  // bt.insertLevelOrder('*');
  // bt.insertLevelOrder('B');
  // bt.insertLevelOrder('-');
  // bt.insertLevelOrder('C');
  // bt.insertLevelOrder('^');
  // bt.insertLevelOrder('D');
  // bt.insertLevelOrder('+');
  // bt.insertLevelOrder('E');
  // bt.insertLevelOrder('/');
  // bt.insertLevelOrder('F');
  
  // bt.insertAtTarget(2, 4);
  // bt.insertAtTarget(2, 5);
  // bt.insertAtTarget(3, 6);

  // bt.delete(3);

  // print("Height of Binary Tree: , ${bt.maxDepth(bt.root)}");

  
//   bt.printTree();
//   print('Traversal PreOrder');
//   bt.printPreOrder(bt.root);

//   print('\nTraversal InOrder');
//   bt.printInOrder(bt.root);

//   print('\nTraversal PostOrder');
//   bt.printPostOrder(bt.root);
}