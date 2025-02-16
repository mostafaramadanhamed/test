// from low to high
// logical or
// var isPrimary = switch (color) {
//   Color.red || Color.yellow || Color.blue => true,
//   _ => false,
// };

// logical and
//switch ((1, 2)) {
//   // Error, both subpatterns attempt to bind 'b'.
//   case (var a, var b) && (var b, var c): // ...
// }

// relational
//String asciiCharType(int char) {
//   const space = 32;
//   const zero = 48;
//   const nine = 57;
//
//   return switch (char) {
//     < space => 'control',
//     == space => 'space',
//     > space && < zero => 'punctuation',
//     >= zero && <= nine => 'digit',
//     _ => '',
//   };
// }

// cast
//(num, Object) record = (1, 's');
// var (i as int, s as String) = record;

// null check
//String? maybeString = 'nullable with base type String';
// switch (maybeString) {
//   case var s?:
//   // 's' has type non-nullable String here.
// }

// null assert
//List<String?> row = ['user', null];
// switch (row) {
//   case ['user', var name!]: // ...
//   // 'name' is a non-nullable string here.
// }

//constants
//switch (number) {
//   // Matches if 1 == number.
//   case 1: // ...
// }

// variables
//switch ((1, 2)) {
//   // 'var a' and 'var b' are variable patterns that bind to 1 and 2, respectively.
//   case (var a, var b): // ...
//   // 'a' and 'b' are in scope in the case body.
// }

// identifier
//const c = 1;
// switch (2) {
//   case c:
//     print('match $c');
//   default:
//     print('no match'); // Prints "no match".
// }

//parenthesized
// // ...
// x || y => 'matches true',
// x || y && z => 'matches true',
// x || (y && z) => 'matches true',
// // `x || y && z` is the same thing as `x || (y && z)`.
// (x || y) && z => 'matches nothing',
// // ...

// list
//const a = 'a';
// const b = 'b';
// switch (obj) {
//   // List pattern [a, b] matches obj first if obj is a list with two fields,
//   // then if its fields match the constant subpatterns 'a' and 'b'.
//   case [a, b]:
//     print('$a, $b');
// }

 // rest list
 // var [a, b, ...rest, c, d] = [1, 2, 3, 4, 5, 6, 7];
// // Prints "1 2 [3, 4, 5] 6 7".
// print('$a $b $rest $c $d');

// map
//final {'foo': int? foo} = {};

// record
// // Record pattern with variable subpatterns:
// var (untyped: untyped, typed: int typed) = record;
// var (:untyped, :int typed) = record;
//
// switch (record) {
//   case (untyped: var untyped, typed: int typed): // ...
//   case (:var untyped, :int typed): // ...
// }
//
// // Record pattern with null-check and null-assert subpatterns:
// switch (record) {
//   case (checked: var checked?, asserted: var asserted!): // ...
//   case (:var checked?, :var asserted!): // ...
// }
//
// // Record pattern with cast sub-pattern:
// var (untyped: untyped as int, typed: typed as String) = record;
// var (:untyped as int, :typed as String) = record;

// object
// switch (shape) {
//   // Matches if shape is of type Rect, and then against the properties of Rect.
//   case Rect(width: var w, height: var h): // ...
// }

//wildcard
// switch (record) {
//   case (int _, String _):
//     print('First field is int and second is String.');
// }