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
// @ Queue