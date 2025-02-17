/// control flow
// loops
// for
//var message = StringBuffer('Dart is fun');
// for (var i = 0; i < 5; i++) {
//   message.write('!');
// }
// for in
// for (final Candidate(:name, :yearsExperience) in candidates) {
// print('$name has $yearsExperience of experience.');
// }
// while
//A while loop evaluates the condition before the loop:
//
// while (!isDone()) {
//   doSomething();
// }
// do while
//do {
//   printLine();
// } while (!atEndOfPage());
// break and continue
//Use break to stop looping:
//
// while (true) {
//   if (shutDownRequested()) break;
//   processIncomingRequests();
// }
// content_copy
// Use continue to skip to the next loop iteration:
//
// for (int i = 0; i < candidates.length; i++) {
//   var candidate = candidates[i];
//   if (candidate.yearsExperience < 5) {
//     continue;
//   }
//   candidate.interview();
// }
// branches
// if
// if (isRaining()) {
//   you.bringRainCoat();
// } else if (isSnowing()) {
//   you.wearJacket();
// } else {
//   car.putTopDown();
// }
// if case
// if (pair case [int x, int y]) {
//   print('Was coordinate array $x,$y');
// } else {
//   throw FormatException('Invalid coordinates.');
// }
// switch
// Empty cases fall through to the next case, allowing cases to share a body. For an empty case that does not fall through, use break for its body. For non-sequential fall-through, you can use a continue statement and a label:
//
// switch (command) {
//   case 'OPEN':
//     executeOpen();
//     continue newCase; // Continues executing at the newCase label.
//
//   case 'DENIED': // Empty case falls through.
//   case 'CLOSED':
//     executeClosed(); // Runs for both DENIED and CLOSED,
//
//   newCase:
//   case 'PENDING':
//     executeNowClosed(); // Runs for both OPEN and PENDING.
// }
// Guard clause
// #
// To set an optional guard clause after a case clause, use the keyword when. A guard clause can follow if case, and both switch statements and expressions.
//
// // Switch statement:
// switch (something) {
//   case somePattern when some || boolean || expression:
//     //             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
//     body;
// }
//
// // Switch expression:
// var value = switch (something) {
//   somePattern when some || boolean || expression => body,
//   //               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
// }
//
// // If-case statement:
// if (something case somePattern when some || boolean || expression) {
//   //                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Guard clause.
//   body;
// }
// error handling
// Throw
// #
// Here's an example of throwing, or raising, an exception:
//
// throw FormatException('Expected at least 1 section');
// content_copy
// You can also throw arbitrary objects:
//
// throw 'Out of llamas!';
//Catch
// #
// Catching, or capturing, an exception stops the exception from propagating (unless you rethrow the exception). Catching an exception gives you a chance to handle it:
//
// try {
//   breedMoreLlamas();
// } on OutOfLlamasException {
//   buyMoreLlamas();
// }
// content_copy
// To handle code that can throw more than one type of exception, you can specify multiple catch clauses. The first catch clause that matches the thrown object's type handles the exception. If the catch clause does not specify a type, that clause can handle any type of thrown object:
//
// try {
//   breedMoreLlamas();
// } on OutOfLlamasException {
//   // A specific exception
//   buyMoreLlamas();
// } on Exception catch (e) {
//   // Anything else that is an exception
//   print('Unknown exception: $e');
// } catch (e) {
//   // No specified type, handles all
//   print('Something really unknown: $e');
// }
//Finally
// #
// To ensure that some code runs whether or not an exception is thrown, use a finally clause. If no catch clause matches the exception, the exception is propagated after the finally clause runs:
//
// try {
//   breedMoreLlamas();
// } finally {
//   // Always clean up, even if an exception is thrown.
//   cleanLlamaStalls();
// }
// content_copy
// The finally clause runs after any matching catch clauses:
//
// try {
//   breedMoreLlamas();
// } catch (e) {
//   print('Error: $e'); // Handle the exception first.
// } finally {
//   cleanLlamaStalls(); // Then clean up.
// }
//During development, use an assert statement— assert(<condition>, <optionalMessage>); —to disrupt normal execution if a boolean condition is false.
//
// // Make sure the variable has a non-null value.
// assert(text != null);
//
// // Make sure the value is less than 100.
// assert(number < 100);
//
// // Make sure this is an https URL.
// assert(urlString.startsWith('https'));
//To attach a message to an assertion, add a string as the second argument to assert (optionally with a trailing comma):
//
// assert(
//   urlString.startsWith('https'),
//   'URL ($urlString) should start with "https".',
// );