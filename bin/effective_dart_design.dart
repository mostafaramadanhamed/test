//@ Design

//@ Names

//? DO use terms consistently
//>> good
//>>pageCount         // A field.
//>> updatePageCount() // Consistent with pageCount.
//>>toSomething()     // Consistent with Iterable's toList().
//>>asSomething()     // Consistent with List's asMap().
//>> Point             // A familiar concept.
//! bad
//!convertToSomething() // Inconsistent with toX() precedent.

//? AVOID abbreviations
//>> good
//>> buildRectangles
//>>IOStream
//! bad
//! buildRects
//! InputOutputStream

//? PREFER putting the most descriptive noun last
//>> good
//>>CssFontFaceRule       // A rule for font faces in CSS.
//! bad
//! RuleFontFaceCss

//? CONSIDER making the code read like a sentence
//>> good
//>>// "If errors is empty..."
// if (errors.isEmpty) {//   // ...
// }
//
// "Hey, subscription, cancel!"
// subscription.cancel();
//
// "Get the monsters where the monster has claws."
// monsters.where((monster) => monster.hasClaws);
//! bad
//!// Telling errors to empty itself, or asking if it is?
// if (errors.empty) {
// }
//
// Toggle what? To what?
// subscription.toggle();
//
// Filter the monsters with claws *out* or include *only* those?
// monsters.filter((monster) => monster.hasClaws);

//? PREFER a noun phrase for a non-boolean property or variable
//>> good
//>>list.length
//! bad
//!list.deleteItems

//?PREFER a non-imperative verb phrase for a boolean property or variable
//>> good
//>>isEmpty
//>> hasElements
//! bad
//!empty         // Adjective or verb?
//! withElements  // Sounds like it might hold elements.

//? CONSIDER omitting the verb for a named boolean parameter
// >> good
// Isolate.spawn(entryPoint, message, paused: false);
// var copy = List.from(elements, growable: true);
// var regExp = RegExp(pattern, caseSensitive: false);

//? PREFER the "positive" name for a boolean property or variable
//>> good
// if (socket.isConnected && database.hasData) {
// socket.write(database.read());
// }
//! bad
// if (!socket.isDisconnected && !database.isEmpty) {
// socket.write(database.read());
// }
//? PREFER an imperative verb phrase for a function or method whose main purpose is a side effect
//>> good
/*
list.add('element');
queue.removeFirst();
window.refresh();
 */
//? PREFER a noun phrase or non-imperative verb phrase for a function or method if returning a value is its primary purpose
//>> good
/*
var element = list.elementAt(3);
var first = list.firstWhere(test);
var char = string.codeUnitAt(4);
 */
//? CONSIDER an imperative verb phrase for a function or method if you want to draw attention to the work it performs
//>> good
/*
var table = database.downloadData();
var packageVersions = packageGraph.solveConstraints();
 */
//?AVOID starting a method name with get
//?PREFER naming a method to___() if it copies the object's state to a new object
//?PREFER naming a method as___() if it returns a different representation backed by the original object
//>> good
/*
list.toSet();
var map = table.asMap();
 */
//? AVOID describing the parameters in the function's or method's name
//>> good
/*
list.add(element);
map.remove(key);
 */
//! bad
/*
list.addElement(element)
map.removeKey(key)
 */
//? DO follow existing mnemonic conventions when naming type parameters
//*E for the element type in a collection:
//*K and V for the key and value types in an associative collection:
//*R for a type used as the return type of a function or a class's methods. This isn't common,
//* but appears in typedefs sometimes and in classes that implement the visitor pattern:
//*Otherwise, use T, S, and U for generics that have a single type parameter and where the surrounding type makes its meaning obvious.
//*There are multiple letters here to allow nesting without shadowing a surrounding name.

//@ libraries
//?PREFER making declarations private
//?CONSIDER declaring multiple classes in the same library
//@ classes and mixins
//?AVOID defining a one-member abstract class when a simple function will do
//>> good
typedef Predicate<E> = bool Function(E element);
//! bad
abstract class Predicate2<E> {
  bool test(E element);
}
//?AVOID defining a class that contains only static members
//>> good
DateTime mostRecent(List<DateTime> dates) {
  return dates.reduce((a, b) => a.isAfter(b) ? a : b);
}

const _favoriteMammal = 'weasel';
//! bad
class DateUtils {
  static DateTime mostRecent(List<DateTime> dates) {
    return dates.reduce((a, b) => a.isAfter(b) ? a : b);
  }
}

class _Favorites {
  static const mammal = 'weasel';
}
//?AVOID extending a class that isn't intended to be subclassed
//?DO use class modifiers to control if your class can be extended
//?AVOID implementing a class that isn't intended to be an interface
//?DO use class modifiers to control if your class can be an interface
//?PREFER defining a pure mixin or pure class to a mixin class

//@ Constructors

//? CONSIDER making your constructor const if the class supports it

//@ Members
//? PREFER making fields and top-level variables final
//?DO use getters for operations that conceptually access properties
//?DO use setters for operations that conceptually change properties
//?DON'T define a setter without a corresponding getter
//?AVOID using runtime type tests to fake overloading
//?AVOID public late final fields without initializers
//?AVOID returning nullable Future, Stream, and collection types
//?AVOID returning this from methods just to enable a fluent interface
//@ Types
//? DO type annotate variables without initializers.
//? DO type annotate fields and top-level variables if the type isn't obvious.
//? DON'T redundantly type annotate initialized local variables.
//? DO annotate return types on function declarations.
//? DO annotate parameter types on function declarations.