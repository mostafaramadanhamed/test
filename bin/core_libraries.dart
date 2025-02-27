
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
}

