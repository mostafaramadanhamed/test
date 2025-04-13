
// @ dart core
// ? provides a small but critical set of built-in functionality.
// ? This library is automatically imported into every Dart program.
import 'dart:collection';

pickToughestKid() {
}
void main()
{
assert(int.parse('42') == 42);
assert(int.parse('0x42') == 66);
assert(double.parse('0.50') == 0.5);
//@ Regular expressions
// Here's a regular expression for one or more digits.
  var digitSequence = RegExp(r'\d+');

  var lettersOnly = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

// contains() can use a regular expression.
  assert(!lettersOnly.contains(digitSequence));
  assert(someDigits.contains(digitSequence));

// Replace every match with another string.
  var exedOut = someDigits.replaceAll(digitSequence, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  // @ Lists
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

// Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

// Add to a list.
  fruits.add('kiwis');

// Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

// Get the list length.
  assert(fruits.length == 5);

// Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));
  // @ Sets
  //? A set in Dart is an unordered collection of unique items.
  //? Because a set is unordered, you can't get a set's items by index (position).
  // Create an empty set of strings.
  var ingredients = <String>{};

// Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

// Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

// Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);




  assert(ingredients.contains('titanium'));

// Check whether all the items are in the set.
  assert(ingredients.containsAll(['titanium', 'xenon']));
// You can also create sets using
// one of the constructors.
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
  // @ Maps
  //? A map, commonly known as a dictionary or hash, is an unordered collection of key-value pairs.
  //? Maps associate a key to some value for easy retrieval. Unlike in JavaScript, Dart objects are not maps.
  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu'],
  };
  // clear all elements
  hawaiianBeaches.clear();



// Maps are parameterized types; you can specify what
// types the key and value should be.
  var nobleGas = <int, String>{};
   nobleGas = {54: 'xenon'};

// Retrieve a value with a key.
  assert(nobleGas[54] == 'xenon');

// Check whether a map contains a key.
  assert(nobleGas.containsKey(54));

// Remove a key and its value.
  nobleGases.remove(54);
  assert(!nobleGas.containsKey(54));
  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);

  // @ URLS
  var uri = 'https://example.org/api?foo=some message';
// full
  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);
  //? component
  var encodedCo = Uri.encodeComponent(uri);
  assert(
  encodedCo == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message',
  );

  var decodedCo = Uri.decodeComponent(encoded);
  assert(uri == decodedCo);
// ? parse URIS
  var uriParse = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uriParse.scheme == 'https');
  assert(uriParse.host == 'example.org');
  assert(uriParse.path == '/foo/bar');
  assert(uriParse.fragment == 'frag');
  assert(uriParse.origin == 'https://example.org:8080');
// ? build URIS
  var uriBuild = Uri(
    scheme: 'https',
    host: 'example.org',
    path: '/foo/bar',
    fragment: 'frag',
    queryParameters: {'lang': 'dart'},
  );
  assert(uriBuild.toString() == 'https://example.org/foo/bar?lang=dart#frag');
  //? another way for building
  var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
  assert(httpUri.toString() == 'http://example.org/foo/bar?lang=dart');

  //@ Date Time
  // Get the current date and time.
  var now = DateTime.now();

// Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

// Parse an ISO 8601 date in the UTC time zone.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

// Create a new DateTime from an existing one, adjusting just some properties:
  var sameTimeLastYear = now.copyWith(year: now.year - 1);
  //? The millisecondsSinceEpoch property of a date returns the number of milliseconds since the "Unix epoch"—January 1, 1970, UTC:
  // 1/1/2000, UTC
  var y2 = DateTime.utc(2000);
  assert(y2.millisecondsSinceEpoch == 946684800000);

  // 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);
  //@ Compare to
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);
  //@ implementing map keys
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
  //@ iteration
  for (final process in Processes()) {
    // Do something with the process.
  }
  //@ Exceptions
  //? NoSuchMethodError
  //* Thrown when a receiving object (which might be null) does not implement a method.
  //? ArgumentError
  //* Can be thrown by a method that encounters an unexpected argument.
}

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}
class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(Object other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}
class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  @override
  Process get current => Process();
  @override
  bool moveNext() => true;
}

// A mythical class that lets you iterate through all
// processes. Extends a subclass of [Iterable].
class Processes extends IterableBase<Process> {
  @override
  final Iterator<Process> iterator = ProcessIterator();
}
class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}