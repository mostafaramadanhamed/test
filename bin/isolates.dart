import 'dart:isolate';
//@ isolates
// ? Each isolate has its own global fields, ensuring that none of the state in an isolate is accessible from any other isolate.
// ? Isolates can only communicate to each other via message passing.
// ? No shared state between isolates means concurrency complexities like mutexes or locks and data races won't occur in Dart.
// ? That said, isolates don't prevent race conditions all together.

//* background work
int slowFib(int n) => n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);

// Compute without blocking current isolate.
void fib40() async {
  var result = await Isolate.run(() => slowFib(40));
  print('Fib(40) = $result');
}
// ? Messages sent via SendPort can be almost any type of Dart object, but there are a few exceptions:
//?
//* Objects with native resources, such as Socket.
//* ReceivePort
//* DynamicLibrary
//* Finalizable
//* Finalizer
//* NativeFinalizer
//* Pointer
//* UserTag
//* Instances of classes that are marked with @pragma('vm:isolate-unsendable')

//@ situations where they can be useful:

//? Parsing and decoding exceptionally large JSON blobs.
//? Processing and compressing photos, audio and video.
//? Converting audio and video files.
//? Performing complex searching and filtering on large lists or within file systems.
//? Performing I/O, such as communicating with a database.
//? Handling a large volume of network requests.