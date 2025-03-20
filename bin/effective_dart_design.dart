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