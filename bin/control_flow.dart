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