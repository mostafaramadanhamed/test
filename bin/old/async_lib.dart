//@ Future
//? Future objects appear throughout the Dart libraries, often as the object returned by an asynchronous method.
//? When a future completes, its value is ready to use.

//? Using await
//* code with then instead of async and await
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void runUsingFuture(dynamic args) {
  // ...
  findEntryPoint().then((entryPoint) {
    return runExecutable(entryPoint, args);
  }).then(flushThenExit);
}

//* code with async and await
Future<void> runUsingAsyncAwait(dynamic args) async {
  // ...
  var entryPoint = await findEntryPoint();
  var exitCode = await runExecutable(entryPoint, args);
  await flushThenExit(exitCode);
}

flushThenExit(exitCode) {}

runExecutable(entryPoint, args) {}

findEntryPoint() {}

//? Chaining multiple asynchronous methods
//* then

example() {
  Future result = costlyQuery('url');
  result
      .then((value) => expensiveWork(value))
      .then((_) => lengthyComputation())
      .then((_) => print('Done!'))
      .catchError((exception) {
/* Handle exception... */
  });
}

//* async-await
example2() async {
  try {
    final value = await costlyQuery('url');
    await expensiveWork(value);
    await lengthyComputation();
    print('Done!');
  } catch (e) {
/* Handle exception... */
  }
}

lengthyComputation() {}
Future costlyQuery(url) async {
  return 'l';
}

expensiveWork(value) {}

//? Waiting for multiple futures
multiple() async {
  Future<void> deleteLotsOfFiles() async => 'kk';

  Future<void> copyLotsOfFiles() async => 'oo';

  Future<void> checksumLotsOfOtherFiles() async => 'uu';

  await Future.wait([
    deleteLotsOfFiles(),
    copyLotsOfFiles(),
    checksumLotsOfOtherFiles(),
  ]);
  print('Done with all the long steps!');
  //? handling error for multiple
  try {
    // Wait for each future in a list, returns a list of futures:
    var results = await [deleteLotsOfFiles(), copyLotsOfFiles(), checksumLotsOfOtherFiles()].wait;

  } on ParallelWaitError<List<bool?>, List<AsyncError?>> catch (e) {

    print(e.values[0]);    // Prints successful future
    print(e.values[1]);    // Prints successful future
    print(e.values[2]);    // Prints null when the result is an error

    print(e.errors[0]);    // Prints null when the result is successful
    print(e.errors[1]);    // Prints null when the result is successful
    print(e.errors[2]);    // Prints error
  }
}

//@ Stream


void main(List<String> arguments) async{
  //? Stream's listen() method to subscribe to a list of files
  FileSystemEntity.isDirectory('searchPath').then((isDir) {
    if (isDir) {
      final startingDir = Directory('searchPath');
      startingDir.list().listen((entity) {
        if (entity is File) {
          searchFile(entity, 'searchTerms');
        }
      });
    } else {
      searchFile(File('searchPath'), 'searchTerms');
    }
  });
  //? await for
  if (await FileSystemEntity.isDirectory('searchPath')) {
  final startingDir = Directory('searchPath');
  await for (final entity in startingDir.list()) {
  if (entity is File) {
  searchFile(entity, 'll');
  }
  }
  } else {
  searchFile(File('searchPath'), 'll');
  }



}
void searchFile(File entity, searchTerms) {}
//? transform data, handle error
Future<void> readFileAwaitFor() async {
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = inputStream
      .transform(utf8.decoder)
      .transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
}