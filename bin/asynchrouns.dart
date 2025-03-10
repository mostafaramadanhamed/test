//@ Asynchronous
 //@ Future
//? This example shows how *not* to write asynchronous Dart code.
//* Synchronous
String createSOrderMessage() {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchSUserOrder() =>
// Imagine that this function is
// more complex and slow.
Future.delayed(const Duration(seconds: 2), () => 'Large Latte');

// Asynchronous

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
// Imagine that this function is
// more complex and slow.
Future.delayed(const Duration(seconds: 2), () => 'Large Latte');

Future<void> main() async {
  print('Fetching user order...');
  print(await createOrderMessage());
}
//? handling error
Future<void> printOrderMessage() async {
  try {
    print('Awaiting user order...');
    var order = await fetchUserOrder();
    print(order);
  } catch (err) {
    print('Caught error: $err');
  }
}

 //@ Stream
//? receiving streams
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    sum += value;
  }
  return sum;
}
//? error of event
//*  You can catch the error using try-catch

//? working with streams
Future<int> lastPositive(Stream<int> stream) =>
    stream.lastWhere((x) => x >= 0);
//? kinds of streams
//* Single subscription streams

//>> The most common kind of stream contains a sequence of events that are parts of a larger whole.
//>> Events need to be delivered in the correct order and without missing any of them.
//>> This is the kind of stream you get when you read a file or receive a web request.
//>> Such a stream can only be listened to once. Listening again later could mean missing out on initial events,
//>> and then the rest of the stream makes no sense. When you start listening, the data will be fetched and provided in chunks.

//? Broadcast streams
//>> The other kind of stream is intended for individual messages that can be handled one at a time.
//>> This kind of stream can be used for mouse events in a browser, for example.
//>> You can start listening to such a stream at any time, and you get the events that are fired while you listen.
//>> More than one listener can listen at the same time, and you can listen again later after canceling a previous subscription.