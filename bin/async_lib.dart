
//@ Future
//? Future objects appear throughout the Dart libraries, often as the object returned by an asynchronous method.
//? When a future completes, its value is ready to use.


//? Using await
//* code with then instead of async and await
void runUsingFuture(dynamic args) {
  // ...
  findEntryPoint()
      .then((entryPoint) {
    return runExecutable(entryPoint, args);
  })
      .then(flushThenExit);
}
//* code with async and await
Future<void> runUsingAsyncAwait(dynamic args) async {
  // ...
  var entryPoint = await findEntryPoint();
  var exitCode = await runExecutable(entryPoint, args);
  await flushThenExit(exitCode);
}
flushThenExit(exitCode) {
}

runExecutable(entryPoint, args) {
}

findEntryPoint() {
}


//@ Stream