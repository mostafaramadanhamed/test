

import 'dart:io';
//@ Files and Directions
void main() async {
  var config = File('config.txt');
//? READING FILE AS TEXT
  // Put the whole file in a single string.
  var stringContents = await config.readAsString();
  print('The file is ${stringContents.length} characters long.');

  // Put each line of the file into its own string.
  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');
  //? READING FILE AS BINARY

  var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');
}