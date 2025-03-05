import 'dart:convert';
import 'dart:math';
void main(){
  math();
  convert();
}
//@ math
void math(){
  //? Trigonometry
  // Cosine
  print(cos(pi));

// Sine
  var degrees = 30;
  var radians = degrees * (pi / 180);
// radians is now 0.52359.
  var sinOf30degrees = sin(radians);
// sin 30° = 0.5
  print((sinOf30degrees - 0.5).abs());
  //? min and max
  print(max(1, 1000));
  print(min(1, -1000));
  //? Math constants
  // See the Math library for additional constants.
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951
  //? Random numbers
  var random = Random();
  random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  random.nextInt(10); // Between 0 and 9.
}
//@ convert
void convert(){
//? decoding encoding json
// NOTE: Be sure to use double quotes ("),
// not single quotes ('), inside the JSON string.
// This string is JSON, not Dart.
  var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
''';

  var scores = jsonDecode(jsonString);
  assert(scores is List);

  var firstScore = scores[0];
  assert(firstScore is Map);
  assert(firstScore['score'] == 40);

}
