

import 'dart:convert';
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

  //? HANDLING ERRORS
  try {
    var contents = await config.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }
  //? STREAMING FILE CONTENTS
  Stream<List<int>> inputStream = config.openRead();

  var linesO = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in linesO) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
}