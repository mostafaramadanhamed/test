
// @ dart core
// ? provides a small but critical set of built-in functionality.
// ? This library is automatically imported into every Dart program.
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

}


pickToughestKid() {
}
