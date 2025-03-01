
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
}

