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