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
//?
//>> good

//! bad
