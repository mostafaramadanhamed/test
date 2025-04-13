

import 'dart:convert';
import 'dart:io';
//@ Files and Directions
void mainFiles() async {
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
  //? WRITING FILE CONTENTS
  var logFile = File('log.txt');
  var sink = logFile.openWrite();
  sink.write('FILE ACCESSED ${DateTime.now()}\n');
  await sink.flush();
  await sink.close();
  //? To add to the end of the file,
  //? use the optional mode parameter to specify FileMode.append:

  var sinkMode = logFile.openWrite(mode: FileMode.append);
  await sinkMode.flush();
  await sinkMode.close();
  //? LISTING FILES IN DIRECTORY
  var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
  //? OTHER FUNCTION
  //* Creating a file or directory: create() in File and Directory
  //* Deleting a file or directory: delete() in File and Directory
  //* Getting the length of a file: length() in File
  //* Getting random access to a file: open() in File
}
//@ HTTP clients and servers
//? HTTP SERVER
void mainHTTTP() async {
  final requests = await HttpServer.bind('localhost', 8888);
  await for (final request in requests) {
    processRequest(request);
  }
}

void processRequest(HttpRequest request) {
  print('Got request for ${request.uri.path}');
  final response = request.response;
  if (request.uri.path == '/dart') {
    response
      ..headers.contentType = ContentType('text', 'plain')
      ..write('Hello from the server');
  } else {
    response.statusCode = HttpStatus.notFound;
  }
  response.close();
}