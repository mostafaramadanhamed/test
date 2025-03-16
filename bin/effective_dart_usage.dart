import 'dart:io';
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
Item?  bestDeal(List<Item> cart) {
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
void example( bool nonNullableBool){

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
}}
//?