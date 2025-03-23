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
//! bad
