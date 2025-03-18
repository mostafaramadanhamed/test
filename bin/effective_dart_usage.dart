import 'dart:io';
import 'dart:math';
//@ Usage

//@ libraries
//? DO use strings in part of directives
//? DON'T import libraries that are inside the src directory of another package
//? DON'T allow an import path to reach into or out of lib
//? PREFER relative import paths

//@ Null
//? DON'T explicitly initialize variables to null
//* example
//>> good
Item? bestDeal(List<Item> cart) {
  Item? bestItem;

  for (final item in cart) {
    if (bestItem == null || item.price < bestItem.price) {
      bestItem = item;
    }
  }

  return bestItem;
}

class Item {
  final num price;
  Item(this.price);
}

//! bad
Item? bestDeal2(List<Item> cart) {
  Item? bestItem = null;

  for (final item in cart) {
    if (bestItem == null || item.price < bestItem.price) {
      bestItem = item;
    }
  }

  return bestItem;
}
//? DON'T use an explicit default value of null
//* example
//>> good

void error([String? message]) {
  stderr.write(message ?? '\n');
}

//! bad
void error2([String? message = null]) {
  stderr.write(message ?? '\n');
}

//? DON'T use true or false in equality operations
//* example
//>> good
void example(bool nonNullableBool) {
  if (nonNullableBool) {
//...
  }

  if (!nonNullableBool) {
//...
  }
//! bad
  if (nonNullableBool == true) {
//...
  }

  if (nonNullableBool == false) {
//...
  }
}

//? AVOID late variables if you need to check whether they are initialized
//? CONSIDER type promotion or null-check patterns for using nullable types
//* example
class Response {
  final int errorCode;
  final String reason;
  final String url;
  Response(this.errorCode, this.reason, this.url);
}

//>> good
class UploadException {
  final Response? response;

  UploadException([this.response]);

  @override
  String toString() {
    if (response case var response?) {
      return 'Could not complete upload to ${response.url} '
          '(error code ${response.errorCode}): ${response.reason}.';
    }
    return 'Could not upload (no response).';
  }
}

//! bad
class UploadException2 {
  final Response? response;

  UploadException2([this.response]);

  @override
  String toString() {
    if (response != null) {
      return 'Could not complete upload to ${response!.url} '
          '(error code ${response!.errorCode}): ${response!.reason}.';
    }

    return 'Could not upload (no response).';
  }
}

//@ String
//?DO use adjacent strings to concatenate string literals
//* example
//>> good
// raiseAlarm(
// 'ERROR: Parts of the spaceship are on fire. Other '
// 'parts are overrun by martians. Unclear which are which.',
// );
//! bad
// raiseAlarm(
//   'ERROR: Parts of the spaceship are on fire. Other ' +
//       'parts are overrun by martians. Unclear which are which.',
// );
//?PREFER using interpolation to compose strings and values
//* example
//>> good
// 'Hello, $name! You are ${year - birth} years old.';
//! bad
// 'Hello, ' + name + '! You are ' + (year - birth).toString() + ' y...';
//? AVOID using curly braces in interpolation when not needed
//* example
//>> good
// var greeting = 'Hi, $name! I love your ${decade}s costume.';
//! bad
// var greeting2 = 'Hi, ${name}! I love your ${decade}s costume.';
class Address {}

//@ Collection
//?DO use collection literals when possible
//>> good
var points = <Point>[];
var addresses = <String, Address>{};
var counts = <int>{};
//! bad
var addresses2 = Map<String, Address>();
var counts2 = Set<int>();
//?DON'T use .length to see if a collection is empty
//>> good
fgh() {
  String lunchBox = '';
  if (lunchBox.isEmpty) return 'so hungry...';
//! bad
  if (lunchBox.length == 0) return 'so hungry...';
}

//?AVOID using Iterable.forEach() with a function literal
//>> good
//* for (final person in people) {
//* }
//! bad
// * people.forEach((person) {
// * });
//?DON'T use List.from() unless you intend to change the type of the result
//>> good
ex() {
  var iterable = [1, 2, 3];
  print(iterable.toList().runtimeType);
//! bad
  print(List.from(iterable).runtimeType);
}

//?DO use whereType() to filter a collection by type
//>> good
var objects = [1, 'a', 2, 'b', 3];
var ints = objects.whereType<int>();
//! bad
var ints2 = objects.where((e) => e is int).cast<int>();
//?DON'T use cast() when a nearby operation will do
//>> good
var stuff = <dynamic>[1, 2];
var filter = List<int>.from(stuff);
//! bad
var filter2 = stuff.toList().cast<int>();
//?AVOID using cast()
//>> good
List<int> singletonList(int value) {
  var list = <int>[];
  list.add(value);
  return list;
}

//! bad
List<int> singletonList2(int value) {
  var list = []; // List<dynamic>.
  list.add(value);
  return list.cast<int>();
}

//@ Functions
//? DO use a function declaration to bind a function to a name
//>> good
void localFunction() {}
//! bad
var localFunction2 = () {};
//?DON'T create a lambda when a tear-off will do
//>> good
nonLambda() {
  var charCodes = [68, 97, 114, 116];
  var buffer = StringBuffer();

// Function:
  charCodes.forEach(print);

// Method:
  charCodes.forEach(buffer.write);

// Named constructor:
  var strings = charCodes.map(String.fromCharCode);

// Unnamed constructor:
  var buffers = charCodes.map(StringBuffer.new);
}

//! bad
lambda() {
  var charCodes = [68, 97, 114, 116];
  var buffer = StringBuffer();

// Function:
  charCodes.forEach((code) {
    print(code);
  });

// Method:
  charCodes.forEach((code) {
    buffer.write(code);
  });

// Named constructor:
  var strings = charCodes.map((code) => String.fromCharCode(code));

// Unnamed constructor:
  var buffers = charCodes.map((code) => StringBuffer(code));
}
//@ Variable
//?DO follow a consistent rule for var and final on local variables
//>> good

//! bad

//?AVOID storing what you can calculate
//>> good
class Circle {
  double radius;

  Circle(this.radius);

  double get area => pi * radius * radius;
  double get circumference => pi * 2.0 * radius;
}

//! bad
class Circle2 {
  double radius;
  double area;
  double circumference;

  Circle2(double radius)
      : radius = radius,
        area = pi * radius * radius,
        circumference = pi * 2.0 * radius;
}

//@ Members
//?DON'T wrap a field in a getter and setter unnecessarily
// ?PREFER using a final field to make a read-only property
//>> good
class Box {
  final Object contents = [];
}

//! bad
class Box2 {
  Object? _contents;
  Object? get contents => _contents;
  set contents(Object? value) {
    _contents = value;
  }
}

//?CONSIDER using => for simple members
//>> good

String capitalize(String name) =>
    '${name[0].toUpperCase()}${name.substring(1)}';
//! bad
String capitalize2(String name) {
  return '${name[0].toUpperCase()}${name.substring(1)}';
}

//?DON'T use this. except to redirect to a named constructor or to avoid shadowing
//>> good
class ShadeOfGray {
  final int brightness;

  ShadeOfGray(int val) : brightness = val;

  ShadeOfGray.black() : this(0);

  // But now it will!
  ShadeOfGray.alsoBlack() : this.black();
}

//! bad
class ShadeOfGray2 {
  final int brightness;

  ShadeOfGray2(int val) : brightness = val;

  ShadeOfGray2.black() : this(0);

// This won't parse or compile!
// ShadeOfGray.alsoBlack() : black();
}

//?DO initialize fields at their declaration when possible
//>> good
class ProfileMark {
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
}

//! bad
class ProfileMark2 {
  final String name;
  final DateTime start;

  ProfileMark2(this.name) : start = DateTime.now();
  ProfileMark2.unnamed()
      : name = '',
        start = DateTime.now();
}

//@ Constructors
//? DO use initializing formals when possible
//? DON'T use late when a constructor initializer list will do
//? DO use ; instead of {} for empty constructor bodies
//>> good
class Point {
  double x, y;
  Point(this.x, this.y);
}

//! bad
class Point2 {
  late double x, y;
  Point2(double x, double y)
      : x = x,
        y = y;
//  Point2(this.x, this.y) {}
}

//? DON'T use new
//>> good
//* Widget build(BuildContext context) {
// *  return Row(
//     children: [RaisedButton(child: Text('Increment')), Text('Click!')],
//   );
// }
//! bad
//* Widget build(BuildContext context) {
// *  return new Row(
//     children: [
//       new RaisedButton(child: new Text('Increment')),
//       new Text('Click!'),
//     ],
//   );
// }
//?DON'T use const redundantly
//>> good
//* const primaryColors = [
// *  Color('red', [255, 0, 0]),
// *  Color('green', [0, 255, 0]),
// *  Color('blue', [0, 0, 255]),
// * ];
//! bad
//* const primaryColors2 = const [
// *  const Color('red', const [255, 0, 0]),
// *  const Color('green', const [0, 255, 0]),
// *  const Color('blue', const [0, 0, 255]),
// ];
//@ Error Handling
//?AVOID catches without on clauses
//?DON'T discard errors from catches without on clauses
//?DO throw objects that implement Error only for programmatic errors
//?DON'T explicitly catch Error or types that implement it
//?DO use rethrow to rethrow a caught exception
//?
//>> good
exampleRethrow() {
  try {
    somethingRisky();
  } catch (e) {
    if (!canHandle(e)) rethrow;
    handle(e);
  }
}
void handle(Object e) {}

bool canHandle(Object e) {
  return true;
}
void somethingRisky() {}

//! bad
exampleThrow(){try {
somethingRisky();
} catch (e) {
if (!canHandle(e)) throw e;
handle(e);
}}
//?
//>> good

//! bad

//?
//>> good

//! bad

//?
//>> good

//! bad
