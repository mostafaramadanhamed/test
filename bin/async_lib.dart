
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

//? Chaining multiple asynchronous methods
//* then

example(){

Future result = costlyQuery('url');
result
    .then(
(value) => expensiveWork(value))
    .then((_) => lengthyComputation())
    .then((_) => print('Done!'))
    .catchError((exception) {
/* Handle exception... */
});}

//* async-await
example2()async{
  try {
final value = await costlyQuery('url');
await expensiveWork(value);
await lengthyComputation();
print('Done!');
} catch (e) {
/* Handle exception... */
}}

lengthyComputation() {
}
Future costlyQuery(url) async {
return 'l';
}
expensiveWork(value) {
}
//@ Stream