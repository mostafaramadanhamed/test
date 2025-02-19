/**
    Constructors
    Constructors are special functions that create instances of classes.

    Dart implements many types of constructors. Except for default constructors, these functions use the same name as their class.

    Generative constructors: Creates new instances and initializes instance variables.
    Default constructors: Used to create a new instance when a constructor hasn't been specified. It doesn't take arguments and isn't named.
    Named constructors: Clarifies the purpose of a constructor or allows the creation of multiple constructors for the same class.
    Constant constructors: Creates instances as compile-type constants.
    Factory constructors: Either creates a new instance of a subtype or returns an existing instance from cache.
    Redirecting constructor: Forwards calls to another constructor in the same class.
 */
// Generative constructors

//To instantiate a class, use a generative constructor.
const double xOrigin = 0;
const double yOrigin = 0;
// Named constructors
// #
// Use a named constructor to implement multiple constructors for a class or to provide extra clarity:
class Point {
// Instance variables to hold the coordinates of the point.
double x;
double y;

// Generative constructor with initializing formal parameters:
Point(this.x, this.y);

  // Named constructor
  Point.origin() : x = xOrigin, y = yOrigin;

  Point.tre():x=0,y =9;

  // Delegates to the main constructor.
  Point.alongXAxis(double x) : this(x, 0);
}
//
// Constant constructors
// #
// If your class produces unchanging objects, make these objects compile-time constants.
// To make objects compile-time constants, define a const constructor with all instance variables set as final.

class ImmutablePoint {
static const ImmutablePoint origin = ImmutablePoint(0, 0);

final double x, y;

const ImmutablePoint(this.x, this.y);
}

//To declare an operator, use the built-in identifier operator then the operator you are defining.
// The following example defines vector addition (+), subtraction (-), and equality (==):

class Vector {
final int x, y;

Vector(this.x, this.y);

Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

@override
bool operator ==(Object other) =>
other is Vector && x == other.x && y == other.y;

@override
int get hashCode => Object.hash(x, y);
}

void main() {
final v = Vector(2, 3);
final w = Vector(2, 2);
var rect = Rectangle(3, 4, 20, 15);
assert(rect.left == 3);
rect.right = 12;
assert(rect.left == -8);
assert(v + w == Vector(4, 5));
assert(v - w == Vector(0, 1));
}
class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  double get right => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}

