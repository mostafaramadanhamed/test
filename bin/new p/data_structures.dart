import 'dart:collection';

void main (){
//** Stack
var stack=Stack<int>();
stack.push(1);
stack.push(2);
stack.push(3);
stack.push(4);
stack.push(5);
stack.push(6);
print(stack);
stack.pop();
print(stack);
stack.pop();
stack.pop();
stack.pop();
print(stack);
// @ Queue
var queue =Queue<int> ();
queue.add(1);
queue.add(2);
queue.add(3);
queue.add(4);
queue.add(5);
queue.add(6);
print(queue);
queue.removeFirst();
print(queue);
queue.removeFirst();
queue.removeFirst();
queue.removeFirst();
print(queue);
//@ Linked List
  final list = LinkedList<int>();

  // Insert elements
  list.insertAtBeginning(10);
  list.insertAtBeginning(5);
  list.insertAtEnd(20);
  list.insertAtEnd(25);

  print('Linked List after insertions:');
  list.traverse();

  // Delete an element
  list.delete(20);

  print('\nLinked List after deleting 20:');
  list.traverse();

  // Check if list contains a value
  print('\nContains 10? ${list.contains(10)}');
  print('Contains 20? ${list.contains(20)}');

  // Print length of the list
  print('\nLength of list: ${list.length}');

  // Clear the list
  list.clear();
  print('\nLinked List after clearing:');
  list.traverse();
}
//@ Stack
class Stack<T>{
  final List<T>_stack=[];
  //? push (add)
  void push(T value){
    _stack.add(value);
  }
  //? pop (remove)
  T pop(){
    if(_stack.isEmpty) {
      throw StateError('Stack is Empty');
    }
    else{
      T lastElement =_stack.last;
      _stack.removeLast();
      return lastElement;
    }
  }
  //? get top
   T top (){
    if(_stack.isEmpty){
      throw StateError("No elements");
    }
    else{
      return _stack.last;
    }
  }
  @override
  String toString() {
    return _stack.toString();
  }

}
//@ Linked List
class Node<T>{
  T value;
  Node<T>?next;

  Node(this.value);

}
class LinkedList<T>{
  Node<T>?head;

  void insertAtBeginning(T value) {
    var newNode = Node<T>(value);
    newNode.next = head;
    head = newNode;
  }

  void insertAtEnd(T value) {
    var newNode = Node<T>(value);
    if (head == null) {
      head = newNode;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }
  void delete(T value) {
    if (head == null) {
      return;
    }
    if (head!.value == value) {
      head = head!.next;
      return;
    }
    var current = head;
    while (current!.next != null) {
      if (current.next!.value == value) {
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }
  void clear() {
    head = null;
  }
  int get length {
    int count = 0;
    var current = head;
    while (current != null) {
      count++;
      current = current.next;
    }
    return count;
  }
  bool contains(T value) {
    var current = head;
    while (current != null) {
      if (current.value == value) return true;
      current = current.next;
    }
    return false;
  }
  void traverse() {
    var current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

}