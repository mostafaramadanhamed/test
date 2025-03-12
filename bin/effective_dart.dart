//? Style Guide – This defines the rules for laying out and organizing code,
//* or at least the parts that dart format doesn't handle for you.
//* The style guide also specifies how identifiers are formatted: camelCase, using_underscores, etc.
//? Documentation Guide – This tells you everything you need to know about what goes inside comments.
//* Both doc comments and regular, run-of-the-mill code comments.
//* Usage Guide – This teaches you how to make the best use of language features to implement behavior.
//* If it's in a statement or expression, it's covered here.
//? Design Guide – This is the softest guide, but the one with the widest scope.
//* It covers what we've learned about designing consistent, usable APIs for libraries.
//* If it's in a type signature or declaration, this goes over it.

//@ Style
//? identifier
//* Identifiers come in three flavors in Dart.
//>> UpperCamelCase names capitalize the first letter of each word, including the first.
//>> lowerCamelCase names capitalize the first letter of each word, except the first which is always lowercase, even if it's an acronym.
//>> lowercase_with_underscores names use only lowercase letters, even for acronyms, and separate words with _.

//? DO name types using UpperCamelCase
//>> Linter rule: camel_case_types

//>> Classes, enum types, typedefs,
//>> and type parameters should capitalize the first letter of each word (including the first word), and use no separators.
//* ex
class Person{}
typedef Predicate<T> = bool Function(T value);

//? DO name extensions using UpperCamelCase
extension Human on String {}

//? DO name packages, directories, and source files using lowercase_with_underscores

//>> good
//* my_package
//* └─ lib
//*    └─ file_system.dart
//*    └─ slider_menu.dart
//! bad
//* mypackage
//* └─ lib
//*    └─ file-system.dart
//*    └─ SliderMenu.dart

//? DO name import prefixes using lowercase_with_underscores
//>>good
//* import 'dart:math' as math;
//* import 'package:angular_components/angular_components.dart' as angular_components;
//* import 'package:js/js.dart' as js;
//! bad
//* import 'dart:math' as Math;
//* import 'package:angular_components/angular_components.dart' as angularComponents;
//* import 'package:js/js.dart' as JS;

//?DO name other identifiers using lowerCamelCase
//* Class members, top-level definitions, variables, parameters,
//* and named parameters should capitalize the first letter of each word except the first word, and use no separators.
//>>good
var count = 3;

 // HttpRequest httpRequest;

 void align(bool clearItems) { }

//? PREFER using lowerCamelCase for constant names
//>> good
const pi=3.14;
//! bad
const PI =3.14;

//? DO capitalize acronyms and abbreviations longer than two letters like words
//>> good
//? Longer than two letters, so always like a word:
//? Http // "hypertext transfer protocol"
//? Nasa // "national aeronautics and space administration"
//? Two letters, capitalized in English, so capitalized in an identifier:
//? UI // "user interface"
//? Two letters, not capitalized in English, so like a word in an identifier:
//? Mr // "mister"
//! HTTP // "hypertext transfer protocol"
//! Ui // "user interface"
//! MR // "mister"

//? PREFER using wildcards for unused callback parameters
//* futureOfVoid.then((_) {
//* print('Operation complete.');
//* });

//? DON'T use a leading underscore for identifiers that aren't private
//? DON'T use prefix letters
//>> good
//* defaultTimeout
//! bad
//* kDefaultTimeout

//? DON'T explicitly name libraries
//! bad
//! library my_library;
//>> good
//>> @TestOn('browser')
//>> library;
