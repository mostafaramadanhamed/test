//@ Asynchronous
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