void main(){
  print('play');
  // non nullable
  int i;
  // nullable variable
  int ? t;
  // variable with initial value
  int e=0;
  int lineCount;
  //var _ = 1;
  int _ = 2;
  // record
  var record = ('first', a: 2, b: true, 'last');
  print(record);
  ({int a, int b}) recordAB = (a: 1, b: 2);
  ({int a, int b}) recordGH=(a:1,b:5);
  ({int x, int y}) recordXY = (x: 3, y: 4);

// Compile error! These records don't have the same type.
 //recordAB = recordXY;
  print(recordAB==recordGH);
  // generics types
  var names = [];
  names.addAll(['Seth', 'Kathy', 'Lars']);
  names.add(42); //
  print(names);
  // type system
  //✗ static analysis: failure
  // void printInts(List<int> a) => print(a);
  //
  // void main() {
  //   final list = [];
  //   list.add(1);
  //   list.add('2');
  //   printInts(list);
  // }
  void printInts(List<int> a) => print(a);
    final list = <int>[];
    list.add(1);
    list.add(2);
    printInts(list);

}
// record swap
//(int, int) swap((int, int) record) {
//   var (a, b) = record;
//   return (b, a);
// }

/*
unary postfix	expr++    expr--    ()    []    ?[]    .    ?.    !	None
unary prefix	-expr    !expr    ~expr    ++expr    --expr      await expr	None
multiplicative	*    /    %  ~/	Left
additive	+    -	Left
shift	<<    >>    >>>	Left
bitwise AND	&	Left
bitwise XOR	^	Left
bitwise OR	|	Left
relational and type test	>=    >    <=    <    as    is    is!	None
equality	==    !=	None
logical AND	&&	Left
logical OR	||	Left
if-null	??	Left
conditional	expr1    ?    expr2    :    expr3	Right
cascade	..    ?..	Left
assignment	=    *=    /=   +=   -=   &=   ^=   etc.	Right
spread (See note)	...    ...?	None
 */
// single comment
/*
multiline comment
 */
/// document comment
/**
 document comment
 **/