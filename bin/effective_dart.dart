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