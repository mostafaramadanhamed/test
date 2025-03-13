//@ Documentation

//@ comments
//? DO format comments like sentences
//* // Not if anything comes before it.
//* if (_chunks.isNotEmpty) return false;
//? DON'T use block comments for documentation
void greet(String name) {
 //>> good
 // Assume we have a valid name.
 //! bad
 /* Assume we have a valid name. */
 print('Hi, $name!');
}

//@ Doc comments
//? DO use /// doc comments to document members and types
//>> good
/// The number of characters in this chunk when unsplit.
 int get length => 8;

//! bad
// The number of characters in this chunk when unsplit.
 int get lengthC => 8;

//? PREFER writing doc comments for public APIs
//?CONSIDER writing a library-level doc comment
//?CONSIDER writing doc comments for private APIs
//?DO start doc comments with a single-sentence summary
//?DO separate the first sentence of a doc comment into its own paragraph
//?AVOID redundancy with the surrounding context
//?PREFER starting function or method comments with third-person verbs
//?PREFER starting a non-boolean variable or property comment with a noun phrase
//?PREFER starting a boolean variable or property comment with "Whether" followed by a noun or gerund phrase
//?DON'T write documentation for both the getter and setter of a property
//?PREFER starting library or type comments with noun phrases
//?CONSIDER including code samples in doc comments
//?DO use square brackets in doc comments to refer to in-scope identifiers
//?DO use prose to explain parameters, return values, and exceptions
//?DO put doc comments before metadata annotations

//@ Markdown
//?AVOID using markdown excessively
//?AVOID using HTML for formatting
//?PREFER backtick fences for code blocks

//@ Writing
//?PREFER brevity
//?AVOID abbreviations and acronyms unless they are obvious
//?PREFER using "this" instead of "the" to refer to a member's instance